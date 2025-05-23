import 'package:community_with_legends_mobile/src/shared/data/data_sources/user_data_source.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/user_model.dart';
import 'package:community_with_legends_mobile/src/shared/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  UserDataSource userDataSource;

  UserRepositoryImpl(this.userDataSource);

  @override
  Future<User> getUserById(int id) async {
    return userDataSource.getUserById(id);
  }
}
