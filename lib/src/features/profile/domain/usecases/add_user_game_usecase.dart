import 'package:community_with_legends_mobile/src/features/profile/domain/models/user_game_status_enum.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/repositories/profile_repository.dart';

class AddUserGameUsecase {
  ProfileRepository profileRepository;

  AddUserGameUsecase(this.profileRepository);

  Future<void> execute(int gameId, UserGameStatus status){
    return profileRepository.addUserGame(gameId, status);
  }
}
