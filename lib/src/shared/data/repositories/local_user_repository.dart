import 'dart:async';

import 'package:community_with_legends_mobile/database/app_database.dart' as db;
import 'package:community_with_legends_mobile/src/shared/domain/models/user_model.dart';
import 'package:community_with_legends_mobile/src/shared/domain/repositories/user_repository.dart';
import 'package:drift/drift.dart';

class LocalUserRepositoryImpl extends UserRepository {
  @override
  Future<User> getUserById(int id) async {
    //TODO  create singleton provider
    final database = db.AppDatabase();

    final user = await (database.select(database.users)
          ..where((u) => u.id.equals(id)))
        .getSingle();

    return user as User;
  }

  void cacheUser(User user){
    final database = db.AppDatabase();
    database.into(database.users).insertOnConflictUpdate(
      db.UsersCompanion.insert(
        id: Value(user.id),
        name: user.name,
        email: user.email,
        emailVerifiedAt: Value(user.emailVerifiedAt),
        createdAt: user.createdAt,
      ),
    );
  }
}
