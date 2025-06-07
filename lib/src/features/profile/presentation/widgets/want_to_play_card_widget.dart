import 'package:community_with_legends_mobile/l10n/generated/app_localizations.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/models/user_game_model.dart';
import 'package:community_with_legends_mobile/src/features/profile/presentation/widgets/profile_card_widget.dart';
import 'package:flutter/cupertino.dart';

class WantToPlayCard extends StatelessWidget {
  final List<UserGame> userGames;

  const WantToPlayCard({
    super.key,
    required this.userGames,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

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
                localizations.profile_wantToPlay,
                style: const TextStyle(fontSize: 50),
              ),
            ),
          ),
          const SizedBox(height: 20),
          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: userGames.map((userGame) {
              return Image.network(userGame.game.cover);
            }).toList(),
          ),
        ],
      ),
    );
  }
}
