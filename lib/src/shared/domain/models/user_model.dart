import 'package:community_with_legends_mobile/database/app_database.dart' as db;
import 'package:community_with_legends_mobile/src/shared/domain/models/permissions_enum.dart';

class User {
  final int id;
  final String name;
  final String email;
  final String avatarUrl;
  final bool isBanned;
  final bool hasPassword;
  final bool hasTwitchAccount;
  final DateTime? emailVerifiedAt;
  final DateTime createdAt;
  final List<Permission>? permissions;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.avatarUrl,
    required this.isBanned,
    required this.hasPassword,
    required this.hasTwitchAccount,
    required this.emailVerifiedAt,
    required this.createdAt,
    this.permissions,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      avatarUrl: json['avatar'],
      isBanned: json['isBanned'],
      hasPassword: json['hasPassword'],
      hasTwitchAccount: json['hasTwitchAccount'],
      emailVerifiedAt: DateTime.tryParse(json['email_verified_at'] ?? ''),
      createdAt: DateTime.parse(json['created_at']),
      permissions: json['permissions'] == null
          ? null
          : (json['permissions'] as List<dynamic>)
              .map((tagJson) => Permission.fromString(tagJson))
              .toList(),
    );
  }

  factory User.fromDrift(db.User data) {
    return User(
      id: data.id,
      name: data.name,
      email: data.email,
      avatarUrl: data.avatarUrl,
      isBanned: data.isBanned,
      hasPassword: data.hasPassword,
      hasTwitchAccount: data.hasTwitchAccount,
      emailVerifiedAt: data.emailVerifiedAt,
      createdAt: data.createdAt,
    );
  }

  bool hasPermission(Permission permission) {
    return permissions?.contains(permission) ?? false;
  }
}
