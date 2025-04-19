import 'package:community_with_legends_mobile/src/features/feed/domain/models/tag_model.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/game_model.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/user_model.dart';

class Post {
  final int id;
  final int userId;
  final int? gameId;
  final int? tagId;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;
  late int reactionsCount;
  final User user;
  final Game? game;
  final List<Tag>? tags;

  Post({
    required this.id,
    required this.userId,
    this.gameId,
    this.tagId,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.reactionsCount,
    required this.user,
    this.game,
    this.tags,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] ?? -1,
      userId: json['user_id'],
      gameId: json['game_id'],
      content: json['content'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      reactionsCount: json['reactions_count'],
      game: json['game'] == null ? null : Game.fromJson(json['game']),
      tags: (json['tags'] as List<dynamic>)
          .map((tagJson) => Tag.fromJson(tagJson))
          .toList(),
      user: User.fromJson(json['user']),
    );
  }
}
