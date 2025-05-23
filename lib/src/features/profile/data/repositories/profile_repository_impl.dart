import 'package:community_with_legends_mobile/src/features/profile/data/data_sources/profile_datasource.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/user_model.dart';

class ProfileRepositoryImpl implements ProfileRepository{
  ProfileDatasource profileDatasource;

  ProfileRepositoryImpl(this.profileDatasource);

  @override
  Future<User> getUserProfile(int userId) async {
    final response = await profileDatasource.getUserProfile(userId);

    return User.fromJson(response['data']);
  }

  @override
  Future<User> getCurrentUserProfile() async {
    final response = await profileDatasource.getCurrentUserProfile();

    return User.fromJson(response);
  }

}
