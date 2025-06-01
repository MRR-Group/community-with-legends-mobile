import 'package:community_with_legends_mobile/src/features/profile/domain/models/hardware_model.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/repositories/profile_repository.dart';

class UpdateUserHardwareUsecase {
  ProfileRepository profileRepository;

  UpdateUserHardwareUsecase(this.profileRepository);

  Future<void> execute(Hardware hardware){
    return profileRepository.updateUserHardware(hardware);
  }
}
