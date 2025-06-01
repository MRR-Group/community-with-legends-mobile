import 'package:community_with_legends_mobile/src/features/profile/domain/models/hardware_model.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/repositories/profile_repository.dart';

class AddUserHardwareUsecase {
  ProfileRepository profileRepository;

  AddUserHardwareUsecase(this.profileRepository);

  Future<Hardware> execute(Hardware hardware){
    return profileRepository.addUserHardware(hardware);
  }
}
