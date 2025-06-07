import 'package:community_with_legends_mobile/src/features/feed/presentation/widgets/invalid_post_asset_widget.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/post_asset_model.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class PostVideoAsset extends StatefulWidget {
  final PostAsset postAsset;

  const PostVideoAsset({super.key, required this.postAsset});

  @override
  State<StatefulWidget> createState() => _PostVideoAssetState();
}

class _PostVideoAssetState extends State<PostVideoAsset> {
  late YoutubePlayerController _playerController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final videoId = _getYoutubeVideoId(widget.postAsset.link);

    if (videoId == null) {
      return const InvalidPostAsset();
    }

    _playerController = YoutubePlayerController.fromVideoId(
      videoId: videoId,
      params: const YoutubePlayerParams(
        showControls: false,
        showVideoAnnotations: false,
      ),
    );

    return Container(
      constraints: const BoxConstraints(
        maxHeight: 400,
      ),
      child: YoutubePlayer(
        controller: _playerController,
      ),
    );
  }

  String? _getYoutubeVideoId(String url) {
    final uri = Uri.tryParse(url);
    if (uri == null || uri.host.isEmpty) {
      return null;
    }

    if (uri.host.contains('youtu.be')) {
      return uri.pathSegments.isNotEmpty ? uri.pathSegments[0] : null;
    }

    if (uri.host.contains('youtube.com')) {
      if (uri.path.contains('embed/')) {
        return uri.pathSegments.isNotEmpty ? uri.pathSegments.last : null;
      } else {
        return uri.queryParameters['v'];
      }
    }

    return null;
  }
}
