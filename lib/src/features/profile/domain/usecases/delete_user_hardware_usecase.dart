import 'package:community_with_legends_mobile/src/features/profile/domain/repositories/profile_repository.dart';

class DeleteUserHardwareUsecase {
  ProfileRepository profileRepository;

  DeleteUserHardwareUsecase(this.profileRepository);

  Future<void> execute(int id){
    return profileRepository.deleteUserHardware(id);
  }
}
