import 'package:community_with_legends_mobile/l10n/generated/app_localizations.dart';
import 'package:community_with_legends_mobile/src/features/feed/presentation/controllers/games_controller.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/models/user_game_model.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/models/user_game_status_enum.dart';
import 'package:community_with_legends_mobile/src/features/profile/presentation/controllers/profile_controller.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/game_model.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/alert.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/button.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/default_dropdown_search_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class EditGames extends StatelessWidget {
  final List<UserGame> userGames;
  final UserGameStatus userGameStatus;

  const EditGames({
    super.key,
    required this.userGames,
    required this.userGameStatus,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final gamesController = Provider.of<GamesController>(context);
    final profileController = Provider.of<ProfileController>(context);

    return Column(
      children: [
        ...userGames.map((userGame) {
          return Row(
            children: [
              Expanded(
                child: Text(
                  userGame.game.name,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  softWrap: true,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Button(
                  text: localizations.remove,
                  onPressed: () async => _displayResponseAlert(
                    context,
                    await profileController.deleteGame(context, userGame.id!, userGameStatus),
                  ),
                ),
              ),
            ],
          );
        }),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DefaultDropdownSearch<Game>(
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
            onChanged: (value) async => _displayResponseAlert(
              context,
              await profileController.addGame(
                context,
                value!.id,
                userGameStatus,
              ),
            ),
            keyToString: (key) {
              return key?.name ?? '';
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Align(
            alignment: Alignment.centerRight,
            child: Button(
              text: localizations.done,
              onPressed: () => profileController.closeGameCategoryEditMenu(userGameStatus),
            ),
          ),
        ),
      ],
    );
  }

  void _displayResponseAlert(BuildContext context, String response) {
    Alert.of(context).show(text: response);
  }
}
