import 'package:community_with_legends_mobile/src/features/app_update/domain/models/version_asset_model.dart';

class VersionInfo {
  final String name;
  final DateTime publishedAt;
  final String downloadUrl;
  final String description;

  VersionInfo({
    required this.name,
    required this.publishedAt,
    required this.downloadUrl,
    required this.description,
  });
}
