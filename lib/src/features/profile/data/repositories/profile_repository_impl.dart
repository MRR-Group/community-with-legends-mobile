import 'package:community_with_legends_mobile/src/features/profile/data/data_sources/profile_datasource.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:community_with_legends_mobile/src/shared/data/data_sources/local/local_user_data_source_impl.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileDatasource profileDatasource;
  LocalUserDataSourceImpl localUserDataSourceImpl;

  ProfileRepositoryImpl(this.profileDatasource, this.localUserDataSourceImpl);

  @override
  Future<User> getUserProfile(int userId) async {
    final response = await profileDatasource.getUserProfile(userId);
    final user = User.fromJson(response['data']);

    return user;
  }

  @override
  Future<User> getCurrentUserProfile() async {
    final response = await profileDatasource.getCurrentUserProfile();
    final user = User.fromJson(response);

    localUserDataSourceImpl.cacheUser(user);

    return user;
  }

}
