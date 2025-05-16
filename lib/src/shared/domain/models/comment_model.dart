import 'package:community_with_legends_mobile/src/shared/domain/models/user_model.dart';

class Comment {
  int id;
  String content;
  final DateTime createdAt;
  final User user;

  Comment({
    required this.id,
    required this.content,
    required this.createdAt,
    required this.user,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      content: json['content'],
      createdAt: DateTime.parse(json['created_at']),
      user: User.fromJson(json['user']),
    );
  }
}
