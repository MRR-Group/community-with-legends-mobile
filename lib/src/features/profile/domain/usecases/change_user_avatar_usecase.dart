import 'package:community_with_legends_mobile/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:image_picker/image_picker.dart';

class ChangeUserAvatarUsecase {
  ProfileRepository profileRepository;

  ChangeUserAvatarUsecase(this.profileRepository);

  Future<bool> execute(XFile avatar){
    return profileRepository.changeUserAvatar(avatar);
  }
}
