import 'package:community_with_legends_mobile/l10n/generated/app_localizations.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/models/game_proposal_model.dart';
import 'package:community_with_legends_mobile/src/features/profile/presentation/controllers/profile_controller.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/alert.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SuggestedGameButtons extends StatelessWidget {
  final bool canEdit;
  final GameProposal gameProposal;

  const SuggestedGameButtons({
    super.key,
    required this.canEdit,
    required this.gameProposal,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final profileController = Provider.of<ProfileController>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (canEdit)
          ..._ownerButtons(
            context,
            localizations,
            profileController,
            gameProposal,
          )
        else if (gameProposal.userVote ?? false)
          ..._rejectButton(
            context,
            localizations,
            profileController,
          )
        else
          ..._userButtons(
            context,
            localizations,
            profileController,
          ),
      ],
    );
  }

  List<Widget> _ownerButtons(
    BuildContext context,
    AppLocalizations localizations,
    ProfileController profileController,
    GameProposal gameProposal,
  ) {
    return [
      Button(
        text: localizations.accept,
        onPressed: () async => displayResponse(
          await profileController.acceptProposal(
            context,
            gameProposal,
          ),
        ),
        fontSize: 14,
      ),
      Button(
        text: localizations.reject,
        onPressed: () async => displayResponse(
          await profileController.rejectProposal(
            context,
            gameProposal,
          ),
        ),
        fontSize: 14,
      ),
    ];
  }

  List<Widget> _userButtons(
    BuildContext context,
    AppLocalizations localizations,
    ProfileController profileController,
  ) {
    return [
      Button(
        text: localizations.profile_voteFor,
        onPressed: () async => displayResponse(
          await profileController.voteForProposal(
            context,
            gameProposal,
          ),
        ),
        fontSize: 14,
      ),
      Button(
        text: localizations.profile_voteAgainst,
        onPressed: () async => displayResponse(
          await profileController.voteAgainstProposal(
            context,
            gameProposal,
          ),
        ),
        fontSize: 14,
      ),
    ];
  }

  List<Widget> _rejectButton(
    BuildContext context,
    AppLocalizations localizations,
    ProfileController profileController,
  ) {
    return [
      Button(
        text: localizations.profile_cancelVote,
        onPressed: () async => displayResponse(
          await profileController.removeProposalVote(
            context,
            gameProposal,
          ),
        ),
        fontSize: 14,
      ),
    ];
  }

  void displayResponse(String response) {
    Alert.showGlobal(text: response);
  }
}
