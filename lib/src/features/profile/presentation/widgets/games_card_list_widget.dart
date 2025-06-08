import 'package:community_with_legends_mobile/l10n/generated/app_localizations.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/models/user_game_model.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/models/user_game_status_enum.dart';
import 'package:community_with_legends_mobile/src/features/profile/presentation/controllers/profile_controller.dart';
import 'package:community_with_legends_mobile/src/features/profile/presentation/widgets/game_category_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GamesCardList extends StatelessWidget {
  final List<UserGame>? userGames;
  final bool canEdit;

  const GamesCardList({
    super.key,
    required this.userGames,
    required this.canEdit,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final profileController = Provider.of<ProfileController>(context);

    if (userGames == null) {
      return Container();
    }

    return Column(
      children: [
        GameCard(
          userGames: userGames,
          canEdit: canEdit,
          isEditing: profileController.isEditingWantToPlay,
          title: localizations.profile_wantToPlay,
          onEditClick: () => profileController.openGameCategoryEditMenu(UserGameStatus.to_play),
          userGameStatus: UserGameStatus.to_play,
        ),
        GameCard(
          userGames: userGames,
          canEdit: canEdit,
          isEditing: profileController.isEditingPlaying,
          title: localizations.profile_playing,
          onEditClick: () => profileController.openGameCategoryEditMenu(UserGameStatus.playing),
          userGameStatus: UserGameStatus.playing,
        ),
        GameCard(
          userGames: userGames,
          canEdit: canEdit,
          isEditing: profileController.isEditingPlayed,
          title: localizations.profile_played,
          onEditClick: () => profileController.openGameCategoryEditMenu(UserGameStatus.played),
          userGameStatus: UserGameStatus.played,
        ),
      ],
    );
  }
}
