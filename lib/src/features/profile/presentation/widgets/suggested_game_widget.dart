import 'package:community_with_legends_mobile/l10n/generated/app_localizations.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/models/game_proposal_model.dart';
import 'package:community_with_legends_mobile/src/features/profile/presentation/widgets/game_card_widget.dart';
import 'package:community_with_legends_mobile/src/features/profile/presentation/widgets/suggested_game_buttons_widget.dart';
import 'package:flutter/material.dart';

class SuggestedGame extends StatelessWidget {
  final GameProposal gameProposal;
  final bool canEdit;

  const SuggestedGame({
    super.key,
    required this.gameProposal,
    required this.canEdit,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        width: 500,
        alignment: Alignment.topCenter,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 8,
                    ),
                    child: GameCard(
                      game: gameProposal.game,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${localizations.profile_suggester}:',
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                        softWrap: true,
                      ),
                      SuggestedGameButtons(
                        canEdit: canEdit,
                        alreadyVoted: gameProposal.userVote,
                      ),
                      Text(
                        '${localizations.profile_votes}: ${gameProposal.votes}',
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 100,
              child: Padding(
                padding: const EdgeInsets.only(top: 4, left: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(90),
                        child: Image.network(
                          gameProposal.user.avatarUrl,
                          height: 50,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      gameProposal.user.name,
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
