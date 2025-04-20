import 'package:community_with_legends_mobile/src/features/app_update/domain/models/version_asset_model.dart';

class VersionResponse {
  final String name;
  final DateTime publishedAt;
  final List<VersionAsset> versionAssets;
  final String description;

  VersionResponse({
    required this.name,
    required this.publishedAt,
    required this.versionAssets,
    required this.description,
  });

  factory VersionResponse.fromJson(Map<String, dynamic> json) {
    return VersionResponse(
      name: json['name'],
      publishedAt: DateTime.parse(json['published_at']),
      versionAssets: (json['assets'] as List<dynamic>)
          .map((asset) => VersionAsset.fromJson(asset))
          .toList(),
      description: json['body'],
    );
  }
}
