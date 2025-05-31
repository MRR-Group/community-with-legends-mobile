import 'package:community_with_legends_mobile/src/features/profile/domain/repositories/profile_repository.dart';

class ChangeUserNicknameUsecase {
  ProfileRepository profileRepository;

  ChangeUserNicknameUsecase(this.profileRepository);

  Future<void> execute(String nickname){
    return profileRepository.changeUserNickname(nickname);
  }
}
