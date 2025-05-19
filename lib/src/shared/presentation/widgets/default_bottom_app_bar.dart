import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/navbar_pages.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/navbar_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DefaultBottomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const DefaultBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return BottomAppBar(
      color: backgroundColor,
      height: 55,
      padding: const EdgeInsets.only(left: 24, right: 24, top: 10,),
      child: Row(
        children: [
          NavbarButton(
            navbarPage: NavbarPages.feed,
            icon: Icons.public,
            buttonText: localizations.navbar_feed,
          ),
          const Spacer(),
          NavbarButton(
            navbarPage: NavbarPages.following,
            icon: Icons.favorite_border_outlined,
            buttonText: localizations.navbar_following,
          ),
          const Spacer(),
          NavbarButton(
            navbarPage: NavbarPages.notification,
            icon: Icons.notifications_none_outlined,
            buttonText: localizations.navbar_notifications,
          ),
          const Spacer(),
          NavbarButton(
            navbarPage: NavbarPages.profile,
            icon: Icons.person_outline,
            buttonText: localizations.navbar_profile,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
