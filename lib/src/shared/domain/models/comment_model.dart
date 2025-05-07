import 'package:community_with_legends_mobile/src/shared/domain/models/user_model.dart';

class Comment {
  int id;
  String content;
  final DateTime createdAt;
  final DateTime updatedAt;
  final User user;

  Comment({
    required this.id,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      content: json['content'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      user: User.fromJson(json['user']),
    );
  }
}
