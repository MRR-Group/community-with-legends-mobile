import 'package:community_with_legends_mobile/src/features/profile/domain/repositories/profile_repository.dart';

class LikeProposalUsecase {
  ProfileRepository profileRepository;

  LikeProposalUsecase(this.profileRepository);

  Future<void> execute(int proposalId) async {
    return profileRepository.likeProposal(proposalId);
  }
}
