import 'package:community_with_legends_mobile/src/features/feed/domain/models/tag_model.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/game_model.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/user_model.dart';

class Post {
  final int id;
  final int userId;
  final int? gameId;
  final int? tagId;
  final String content;
  final String createdAt;
  final String updatedAt;
  final User user;
  final Game? game;
  final Tag? tag;

  Post({
    required this.id,
    required this.userId,
    this.gameId,
    this.tagId,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    this.game,
    this.tag,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] ?? -1,
      userId: json['user_id'],
      gameId: json['game_id'],
      tagId: json['tag_id'],
      content: json['content'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      game: Game.fromJson(json['game']),
      tag: Tag.fromJson(json['tag']),
      user: User.fromJson(json['user']),
    );
  }
}
