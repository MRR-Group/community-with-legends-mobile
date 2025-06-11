import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:community_with_legends_mobile/l10n/generated/app_localizations.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/navbar_pages.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/navbar_button.dart';
import 'package:flutter/material.dart';

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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          NavbarButton(
            navbarPage: NavbarPages.feed,
            icon: Icons.public,
            buttonText: localizations.navbar_feed,
          ),
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
