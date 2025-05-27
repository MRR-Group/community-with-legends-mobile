import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:community_with_legends_mobile/l10n/generated/app_localizations.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/permissions_enum.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/user_model.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/controllers/user_controller.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/alert.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/default_popup_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserMenuButton extends StatefulWidget {
  final User user;
  final BuildContext parentContext;

  const UserMenuButton({
    super.key,
    required this.user,
    required this.parentContext,

  });

  @override
  State<StatefulWidget> createState() => _UserMenuButtonState();
}

class _UserMenuButtonState extends State<UserMenuButton> {
  
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final userController = Provider.of<UserController>(context);
    final currentUser = userController.user;

    return PopupMenuButton(
      icon: const Icon(
        Icons.more_horiz,
        color: textDisabledColor,
      ),
      onSelected: (value) async {
        final result =
            await userController.handlePopupMenu(context, value, widget.user);

          if (mounted) {
            Alert.of(widget.parentContext).show(text: result);
          }
      },
      itemBuilder: (context) => <PopupMenuEntry<String>>[
        DefaultPopupMenuItem.build(
          value: 'report',
          label: localizations.user_report,
          icon: Icons.flag_outlined,
        ),
        if (currentUser != null &&
            currentUser.hasPermission(Permission.banUsers))
          DefaultPopupMenuItem.build(
            value: 'ban',
            label: localizations.user_ban,
            icon: Icons.block,
          ),
      ],
    );
  }
}
