import 'package:community_with_legends_mobile/src/features/feed/domain/models/asset_types.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/post_asset_model.dart';
import 'package:flutter/material.dart';

class PostAssetWidget extends StatelessWidget {
  final PostAsset postAsset;

  const PostAssetWidget({super.key, required this.postAsset});

  @override
  Widget build(BuildContext context) {
    if(postAsset.type != AssetType.image){
      return Container();
    }

    if(!_isImageLink(postAsset.link)){
      return _errorImage();
    }

    return Container(
      constraints: const BoxConstraints(
        maxHeight: 400,
      ),
      child: Image.network(
        postAsset.link,
        fit: BoxFit.contain,

        errorBuilder: (context, error, stackTrace) {
          return _errorImage();
        },
        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
      ),
    );
  }
  Widget _errorImage(){
    return const SizedBox(
      width: 100,
      height: 100,
      child: Center(
        child: Icon(
          Icons.image_not_supported_outlined,
          size: 64,
          color: Colors.grey,
        ),
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
