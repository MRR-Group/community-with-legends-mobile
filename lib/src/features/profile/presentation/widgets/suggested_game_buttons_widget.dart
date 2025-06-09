import 'package:community_with_legends_mobile/l10n/generated/app_localizations.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/button.dart';
import 'package:flutter/material.dart';

class SuggestedGameButtons extends StatelessWidget {
  final bool canEdit;
  final bool? alreadyVoted;

  const SuggestedGameButtons({
    super.key,
    required this.canEdit,
    required this.alreadyVoted,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (canEdit)
          ..._ownerButtons(localizations)
        else if (alreadyVoted ?? false)
          ..._rejectButton(localizations)
        else
          ..._userButtons(localizations),
      ],
    );
  }

  List<Widget> _ownerButtons(AppLocalizations localizations) {
    return [
      Button(
        text: localizations.accept,
        onPressed: () {},
        fontSize: 14,
      ),
      Button(
        text: localizations.reject,
        onPressed: () {},
        fontSize: 14,
      ),
    ];
  }

  List<Widget> _userButtons(AppLocalizations localizations) {
    return [
      Button(
        text: localizations.profile_voteFor,
        onPressed: () {},
        fontSize: 14,
      ),
      Button(
        text: localizations.profile_voteAgainst,
        onPressed: () {},
        fontSize: 14,
      ),
    ];
  }

  List<Widget> _rejectButton(AppLocalizations localizations) {
    return [
      Button(
        text: localizations.profile_cancelVote,
        onPressed: () {},
        fontSize: 14,
      ),
    ];
  }
}
