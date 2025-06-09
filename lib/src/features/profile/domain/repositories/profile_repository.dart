import 'package:community_with_legends_mobile/src/features/profile/domain/models/game_proposal_model.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/models/hardware_model.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/models/user_game_model.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/models/user_game_status_enum.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/user_model.dart';
import 'package:image_picker/image_picker.dart';

abstract class ProfileRepository {
  Future<User> getUserProfile(int userId);

  Future<User> getCurrentUserProfile();

  Future<void> changeUserNickname(String nickname);

  Future<bool> changeUserAvatar(XFile avatar);

  Future<void> deleteUserAvatar();

  Future<List<Hardware>?> getUserHardware(int userId);

  Future<void> updateUserHardware(Hardware hardware);

  Future<void> deleteUserHardware(int id);

  Future<Hardware> addUserHardware(Hardware hardware);

  Future<List<UserGame>?> getUserGames(int userId);

  Future<void> deleteUserGame(int id);

  Future<void> addUserGame(int gameId, UserGameStatus status);

  Future<List<GameProposal>?> getUserProposals(int userId);

  Future<void> createProposal(int userId, int gameId);

  Future<void> acceptProposal(int proposalId);

  Future<void> rejectProposal(int proposalId);

  Future<void> likeProposal(int proposalId);

  Future<void> dislikeProposal(int proposalId);

  Future<void> removeProposalVote(int proposalId);
}
