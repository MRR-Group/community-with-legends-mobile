import 'package:community_with_legends_mobile/src/features/profile/domain/repositories/profile_repository.dart';

class DislikeProposalUsecase {
  ProfileRepository profileRepository;

  DislikeProposalUsecase(this.profileRepository);

  Future<void> execute(int proposalId) async {
    return profileRepository.dislikeProposal(proposalId);
  }
}
