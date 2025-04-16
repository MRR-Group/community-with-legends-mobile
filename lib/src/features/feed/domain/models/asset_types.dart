enum AssetType { image, video }

extension AssetTypeExtension on AssetType{
  String get displayName {
    switch (this) {
      case AssetType.image:
        return 'Image';
      case AssetType.video:
        return 'Video';
    }
  }
  int get id {
    switch (this) {
      case AssetType.image:
        return 1;
      case AssetType.video:
        return 2;
    }
  }
}
