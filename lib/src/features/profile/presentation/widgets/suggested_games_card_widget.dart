import 'package:community_with_legends_mobile/l10n/generated/app_localizations.dart';
import 'package:community_with_legends_mobile/src/features/feed/presentation/controllers/games_controller.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/models/game_proposal_model.dart';
import 'package:community_with_legends_mobile/src/features/profile/presentation/controllers/profile_controller.dart';
import 'package:community_with_legends_mobile/src/features/profile/presentation/widgets/profile_card_widget.dart';
import 'package:community_with_legends_mobile/src/features/profile/presentation/widgets/suggested_game_widget.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/game_model.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/user_model.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/default_dropdown_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SuggestedGamesCard extends StatelessWidget {
  final List<GameProposal>? gameProposals;
  final bool canEdit;
  final User userProfile;

  const SuggestedGamesCard({
    super.key,
    required this.gameProposals,
    required this.canEdit,
    required this.userProfile,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final gamesController = Provider.of<GamesController>(context);
    final profileController = Provider.of<ProfileController>(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      width: 500,
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileCard(
            child: Center(
              child: Text(
                localizations.profile_suggested,
                style: const TextStyle(fontSize: 50),
              ),
            ),
          ),
          const SizedBox(height: 16),
          ...(gameProposals ?? []).map((gameProposal) {
            return SuggestedGame(
              gameProposal: gameProposal,
              canEdit: canEdit,
            );
          }),
          const SizedBox(height: 16),
          if(!canEdit)
            DefaultDropdownSearch<Game>(
              showSearchBox: true,
              searchBoxHint: localizations.posts_searchGame,
              listTitle: localizations.posts_addGame,
              compareFn: (item1, item2) => item1.name == item2.name,
              filterFn: (_, __) => true,
              items: (filter, infiniteScrollProps) async {
                return gamesController.loadFilteredGames(
                  context: context,
                  filter: filter,
                );
              },
              onChanged: (value) async {
                if (value == null) {
                  return;
                }

                await profileController.suggestGame(
                  context,
                  value,
                  userProfile,
                );
              },
              keyToString: (key) {
                return key?.name ?? '';
              },
            ),
        ],
      ),
    );
  }
}
