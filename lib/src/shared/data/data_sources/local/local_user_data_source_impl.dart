import 'package:community_with_legends_mobile/database/app_database.dart' as db;
import 'package:community_with_legends_mobile/src/features/profile/domain/models/hardware_model.dart';
import 'package:community_with_legends_mobile/src/shared/data/data_sources/user_data_source.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/user_model.dart';
import 'package:drift/drift.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalUserDataSourceImpl implements UserDataSource {
  final db.AppDatabase localDatabase;

  LocalUserDataSourceImpl({
    required this.localDatabase,
  });

  void cacheUser(User user) {
    final usersTable = localDatabase.users;

    localDatabase.into(usersTable).insertOnConflictUpdate(
          db.UsersCompanion.insert(
            id: Value(user.id),
            name: user.name,
            email: user.email,
            emailVerifiedAt: Value(user.emailVerifiedAt),
            createdAt: user.createdAt,
            avatarUrl: user.avatarUrl,
            isBanned: user.isBanned,
            hasPassword: user.hasPassword,
            hasTwitchAccount: user.hasTwitchAccount,
            permissions: user.permissions?.map((p) => p.name).toList() ?? [],
          ),
        );

    _saveCurrentUserId(user.id);
  }

  Future<void> cacheUserHardware(int userId, List<Hardware> hardware) async {
    final hardwareTable = localDatabase.hardwareTable;

    await localDatabase.batch((batch) {
      batch.insertAllOnConflictUpdate(
        hardwareTable,
        hardware.map(
          (element) => db.HardwareTableCompanion.insert(
            userId: userId,
            title: element.title,
            value: element.value,
          ),
        ),
      );
    });
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
    final usersTable = localDatabase.users;

    final user = await (localDatabase.select(usersTable)
          ..where((u) => u.id.equals(id)))
        .getSingle();

    return User.fromDrift(user);
  }

  Future<List<Hardware>> getUserHardwareById(int userId) async {
    final hardwareTable = localDatabase.hardwareTable;
    final rows = await (localDatabase.select(hardwareTable)
          ..where((element) => element.userId.equals(userId)))
        .get();

    final hardwareList = rows
        .map((e) => Hardware(id: e.id, title: e.title, value: e.value))
        .toList();

    return hardwareList;
  }

  @override
  Future<User> getCurrentUser() async {
    final currentUserId = await _getCurrentUserId();

    if (currentUserId == null) {
      throw Exception('User not found');
    }

    return getUserById(currentUserId);
  }
}
