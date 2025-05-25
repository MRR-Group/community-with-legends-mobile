import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:community_with_legends_mobile/l10n/generated/app_localizations.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/default_popup_menu_item.dart';
import 'package:flutter/material.dart';

class PostMenuButton extends StatelessWidget {
  const PostMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return PopupMenuButton(
      icon: const Icon(
        Icons.more_horiz,
        color: textDisabledColor,
      ),
      itemBuilder: (context) => <PopupMenuEntry<String>>[
        DefaultPopupMenuItem.build(
          value: 'report',
          label: localizations.report_post,
          icon: Icons.flag,
        ),
        DefaultPopupMenuItem.build(
          value: 'delete',
          label: localizations.delete_post,
          icon: Icons.flag,
        ),
        DefaultPopupMenuItem.build(
          value: 'ban',
          label: localizations.ban_author,
          icon: Icons.flag,
        ),
      ],
    );
  }
}
