import 'package:community_with_legends_mobile/src/features/profile/domain/repositories/profile_repository.dart';

class DeleteUserGameUsecase {
  ProfileRepository profileRepository;

  DeleteUserGameUsecase(this.profileRepository);

  Future<void> execute(int id){
    return profileRepository.deleteUserGame(id);
  }
}
