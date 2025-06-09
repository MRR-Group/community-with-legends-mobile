import 'package:community_with_legends_mobile/src/features/profile/domain/models/game_proposal_model.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/repositories/profile_repository.dart';

class GetUserProposalsUsecase {
  ProfileRepository profileRepository;

  GetUserProposalsUsecase(this.profileRepository);

  Future<List<GameProposal>?> execute(int userId){
    return profileRepository.getUserProposals(userId);
  }
}
