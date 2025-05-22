import 'package:community_with_legends_mobile/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/user_model.dart';

class GetUserProfileUsecase {
  ProfileRepository profileRepository;

  GetUserProfileUsecase(this.profileRepository);

  Future<User> execute(int userId){
    return profileRepository.getUserProfile(userId);
  }
}
