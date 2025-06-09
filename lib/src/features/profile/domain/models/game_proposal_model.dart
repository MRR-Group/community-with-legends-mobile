import 'package:community_with_legends_mobile/src/features/profile/domain/models/game_proposal_status_enum.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/game_model.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/user_model.dart';

class GameProposal {
  final int id;
  final User user;
  final User targetUser;
  final Game game;
  final GameProposalStatus status;
  final DateTime createdAt;
  final int votes;
  final bool? userVote;

  GameProposal({
    required this.id,
    required this.user,
    required this.targetUser,
    required this.game,
    required this.status,
    required this.createdAt,
    required this.votes,
    required this.userVote,
  });

  factory GameProposal.fromJson(Map<String, dynamic> json) {
    return GameProposal(
      id: json['id'],
      user: User.fromJson(json['user']),
      targetUser: User.fromJson(json['targetUser']),
      game: Game.fromJson(json['game']),
      status: GameProposalStatus.fromString(json['status']),
      createdAt: DateTime.parse(json['created_at']),
      votes: json['votes'],
      userVote: json['user_vote'],
    );
  }
}
