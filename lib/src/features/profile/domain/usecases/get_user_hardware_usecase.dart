import 'package:community_with_legends_mobile/src/features/profile/domain/models/hardware_model.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/repositories/profile_repository.dart';

class GetUserHardwareUsecase {
  ProfileRepository profileRepository;

  GetUserHardwareUsecase(this.profileRepository);

  Future<List<Hardware>?> execute(int userId){
    return profileRepository.getUserHardware(userId);
  }
}
