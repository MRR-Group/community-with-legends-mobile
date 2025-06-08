import 'package:community_with_legends_mobile/src/features/profile/domain/models/user_game_status_enum.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/game_model.dart';

class UserGame {
  final int? id;
  final UserGameStatus status;
  final Game game;

  UserGame({
    this.id,
    required this.status,
    required this.game,
  });

  factory UserGame.fromJson(Map<String, dynamic> json) {
    return UserGame(
      id: json['id'],
      status: UserGameStatus.fromString(json['status']),
      game: Game.fromJson(json['game']),
    );
  }
}
