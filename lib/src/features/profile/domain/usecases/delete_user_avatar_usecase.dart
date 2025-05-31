import 'package:community_with_legends_mobile/src/features/profile/domain/repositories/profile_repository.dart';

class DeleteUserAvatarUsecase {
  ProfileRepository profileRepository;

  DeleteUserAvatarUsecase(this.profileRepository);

  Future<void> execute(){
    return profileRepository.deleteUserAvatar();
  }
}
