import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:community_with_legends_mobile/l10n/generated/app_localizations.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/models/user_game_model.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/models/user_game_status_enum.dart';
import 'package:community_with_legends_mobile/src/features/profile/presentation/controllers/profile_controller.dart';
import 'package:community_with_legends_mobile/src/features/profile/presentation/widgets/display_games_widget.dart';
import 'package:community_with_legends_mobile/src/features/profile/presentation/widgets/edit_games_widget.dart';
import 'package:community_with_legends_mobile/src/features/profile/presentation/widgets/profile_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WantToPlayCard extends StatelessWidget {
  final List<UserGame> userGames;
  final bool canEdit;

  const WantToPlayCard({
    super.key,
    required this.userGames,
    required this.canEdit,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final profileController = Provider.of<ProfileController>(context);

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
                    localizations.profile_wantToPlay,
                    style: const TextStyle(fontSize: 50),
                  ),
                ),
                if (!profileController.isEditingWantToPlay && canEdit)
                  Positioned(
                    top: 0,
                    right: 0,
                    bottom: 0,
                    child: IconButton(
                      onPressed: () =>
                          profileController.openWantToPlayEditMenu(),
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
          if (profileController.isEditingWantToPlay)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: EditGames(
                userGames: userGames,
                userGameStatus: UserGameStatus.to_play,
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DisplayGames(
                userGames: userGames,
              ),
            ),
        ],
      ),
    );
  }
}
