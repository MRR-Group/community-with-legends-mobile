import 'package:community_with_legends_mobile/src/shared/data/data_sources/remote/remote_user_data_source_impl.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/user_model.dart';
import 'package:community_with_legends_mobile/src/shared/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  UserDataSourceImpl userDataSource;

  UserRepositoryImpl(this.userDataSource);

  @override
  Future<User> getUserById(int id) async {
    return userDataSource.getUserById(id);
  }

  @override
  Future<User> getCurrentUser() {
    return userDataSource.getCurrentUser();
  }

  @override
  Future<void> banUser(int userId) async {
    userDataSource.banUser(userId);
  }

  @override
  Future<void> reportUser(int userId) async {
    userDataSource.reportUser(userId);
  }
}
