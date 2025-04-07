import 'package:community_with_legends_mobile/src/features/feed/domain/models/tag_model.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/game_model.dart';

class Post {
  final int? id;
  final int? userId;
  final int? gameId;
  final int? tagId;
  final String content;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  Game? game;
  Tag? tag;

  Post({
    this.id,
    this.userId,
    this.gameId,
    this.tagId,
    required this.content,
    this.createdAt,
    this.updatedAt,
    this.game,
    this.tag,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      userId: json['user_id'],
      gameId: json['game_id'],
      tagId: json['tag_id'],
      content: json['content'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      game: Game.fromJson(json),
      tag: Tag.fromJson(json),
    );
  }
}
