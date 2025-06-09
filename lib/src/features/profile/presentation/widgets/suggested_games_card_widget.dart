import 'package:community_with_legends_mobile/l10n/generated/app_localizations.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/models/game_proposal_model.dart';
import 'package:community_with_legends_mobile/src/features/profile/presentation/widgets/profile_card_widget.dart';
import 'package:community_with_legends_mobile/src/features/profile/presentation/widgets/suggested_game_widget.dart';
import 'package:flutter/material.dart';

class SuggestedGamesCard extends StatelessWidget {
  final List<GameProposal>? gameProposals;
  final bool canEdit;

  const SuggestedGamesCard({
    super.key,
    required this.gameProposals,
    required this.canEdit,
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
        ],
      ),
    );
  }
}
