import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/models/user_game_model.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/models/user_game_status_enum.dart';
import 'package:community_with_legends_mobile/src/features/profile/presentation/widgets/display_games_widget.dart';
import 'package:community_with_legends_mobile/src/features/profile/presentation/widgets/edit_games_widget.dart';
import 'package:community_with_legends_mobile/src/features/profile/presentation/widgets/profile_card_widget.dart';
import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  final List<UserGame>? userGames;
  final bool canEdit;
  final bool isEditing;
  final String title;
  final Function onEditClick;
  final UserGameStatus userGameStatus;

  const GameCard({
    super.key,
    required this.userGames,
    required this.canEdit,
    required this.isEditing,
    required this.title,
    required this.onEditClick,
    required this.userGameStatus,
  });

  @override
  Widget build(BuildContext context) {
    if (userGames == null || userGames!.isEmpty) {
      return Container();
    }

    final games = userGames!
        .where(
          (userGame) => userGame.status == userGameStatus,
        )
        .toList();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      width: 500,
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileCard(
            child: Stack(
              children: [
                Center(
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 50),
                  ),
                ),
                if (!isEditing && canEdit)
                  Positioned(
                    top: 0,
                    right: 0,
                    bottom: 0,
                    child: IconButton(
                      onPressed: () => onEditClick.call(),
                      icon: const Icon(
                        Icons.edit,
                        color: textColor,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          if (isEditing)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: EditGames(
                userGames: games,
                userGameStatus: userGameStatus,
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DisplayGames(
                userGames: games,
              ),
            ),
        ],
      ),
    );
  }
}
