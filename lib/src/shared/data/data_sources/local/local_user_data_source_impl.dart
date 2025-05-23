import 'package:community_with_legends_mobile/database/app_database.dart' as db;
import 'package:community_with_legends_mobile/src/shared/data/data_sources/user_data_source.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/user_model.dart';
import 'package:drift/drift.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalUserDataSourceImpl implements UserDataSource {
  void cacheUser(User user) {
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

    _saveCurrentUserId(user.id);
  }

  Future<void> _saveCurrentUserId(int id) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setInt('current_user_id', id);
  }

  Future<int?> _getCurrentUserId() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getInt('current_user_id');
  }

  @override
  Future<User> getUserById(int id) async {
    //TODO  create singleton provider
    final database = db.AppDatabase();

    final user = await (database.select(database.users)
          ..where((u) => u.id.equals(id)))
        .getSingle();

    return User.fromDrift(user);
  }

  @override
  Future<User> getCurrentUser() async {
    final currentUserId = await _getCurrentUserId();

    if(currentUserId == null){
      throw Exception('User not found');
    }

    return getUserById(currentUserId);
  }
}
