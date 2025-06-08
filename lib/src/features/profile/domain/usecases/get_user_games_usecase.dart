import 'package:community_with_legends_mobile/src/features/profile/domain/models/user_game_model.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/repositories/profile_repository.dart';

class GetUserGamesUsecase {
  ProfileRepository profileRepository;

  GetUserGamesUsecase(this.profileRepository);

  Future<List<UserGame>?> execute(int userId){
    return profileRepository.getUserGames(userId);
  }
}
