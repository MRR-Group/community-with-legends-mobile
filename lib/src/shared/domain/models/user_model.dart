class User {
  final int id;
  final String name;
  final String email;
  final String password;
  final DateTime emailVerifiedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });
}
