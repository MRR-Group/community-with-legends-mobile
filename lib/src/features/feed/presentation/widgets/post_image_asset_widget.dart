import 'package:community_with_legends_mobile/src/features/feed/presentation/widgets/invalid_post_asset_widget.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/post_asset_model.dart';
import 'package:flutter/material.dart';


class PostImageAssetWidget extends StatelessWidget {
  final PostAsset postAsset;

  const PostImageAssetWidget({super.key, required this.postAsset});

  @override
  Widget build(BuildContext context) {

    if (!_isImageLink(postAsset.link)) {
      return const InvalidPostAsset();
    }

    return Container(
      constraints: const BoxConstraints(
        maxHeight: 400,
      ),
      child: Image.network(
        postAsset.link,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return const InvalidPostAsset();
        },
        loadingBuilder: (
          BuildContext context,
          Widget child,
          ImageChunkEvent? loadingProgress,
        ) {
          if (loadingProgress == null) {
            return child;
          }
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
      ),
    );
  }

  bool _isImageLink(String url) {
    return url.endsWith('.jpg') ||
        url.endsWith('.jpeg') ||
        url.endsWith('.png') ||
        url.endsWith('.gif') ||
        url.endsWith('.webp');
  }
}
