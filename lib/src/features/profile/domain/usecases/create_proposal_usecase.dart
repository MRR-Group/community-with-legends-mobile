import 'package:community_with_legends_mobile/src/features/profile/domain/repositories/profile_repository.dart';

class CreateProposalUsecase {
  ProfileRepository profileRepository;

  CreateProposalUsecase(this.profileRepository);

  Future<void> execute(int userId, int gameId) async {
    return profileRepository.createProposal(userId, gameId);
  }
}
