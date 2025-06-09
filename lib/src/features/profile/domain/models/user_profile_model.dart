import 'package:community_with_legends_mobile/src/features/profile/domain/models/game_proposal_model.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/models/hardware_model.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/models/user_game_model.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/user_model.dart';

class UserProfile {
  final User user;
  final List<Hardware>? hardware;
  final List<UserGame>? userGames;
  final List<GameProposal>? gameProposals;

  UserProfile({
    required this.user,
    this.hardware,
    this.userGames,
    this.gameProposals,
  });

}
