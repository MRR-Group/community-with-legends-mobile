import 'package:community_with_legends_mobile/l10n/generated/app_localizations.dart';

enum AssetType {
  image,
  video;

  static AssetType fromJson(String value) {
    value = value.toLowerCase();
    
    return AssetType.values.firstWhere(
          (e) => e.name == value,
      orElse: () => AssetType.image,
    );
  }
}

extension AssetTypeExtension on AssetType {
  String displayName(AppLocalizations localizations) {
    switch (this) {
      case AssetType.image:
        return localizations.image;
      case AssetType.video:
        return localizations.video;
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
