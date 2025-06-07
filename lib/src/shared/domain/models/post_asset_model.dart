import 'package:community_with_legends_mobile/src/features/feed/domain/models/asset_types.dart';

class PostAsset {
  final int id;
  final String link;
  final AssetType type;

  PostAsset({
    required this.id,
    required this.link,
    required this.type,
  });

  factory PostAsset.fromJson(Map<String, dynamic> json) {
    return PostAsset(
      id: json['id'] ?? -1,
      link: json['link'],
      type: AssetType.fromJson(json['type']),
    );
  }
}
