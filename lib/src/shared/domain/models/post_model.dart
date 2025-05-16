import 'package:community_with_legends_mobile/src/shared/domain/models/comment_model.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/game_model.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/user_model.dart';

class Post {
  final int id;
  final String content;
  final DateTime createdAt;
  late int reactionsCount;
  late bool userReacted;
  final User user;
  final Game? game;
  final List<String>? tags;
  final List<Comment>? comments;

  Post({
    required this.id,
    required this.content,
    required this.createdAt,
    required this.reactionsCount,
    required this.userReacted,
    required this.user,
    this.game,
    this.tags,
    this.comments,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] ?? -1,
      content: json['content'],
      createdAt: DateTime.parse(json['created_at']),
      reactionsCount: json['reactions'],
      userReacted: json['user_reacted'],
      user: User.fromJson(json['user']),
      game: json['game'] == null ? null : Game.fromJson(json['game']),
      tags: ['tags'],
      comments: json['comments'] == null
          ? null
          : (json['comments'] as List<dynamic>)
              .map((commentJson) => Comment.fromJson(commentJson))
              .toList(),
    );
  }
}
