import 'package:community_with_legends_mobile/config/colors.dart';
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
      padding: const EdgeInsets.only(left: 24, right: 24, top: 10),
      child: Row(
        children: [
          Column(
            children: [
              const Icon(
                Icons.public,
                color: primaryColor,
              ),
              Text(
                localizations.navbar_feed,
                style: const TextStyle(
                  color: primaryColor,
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              const Icon(
                Icons.favorite_border_outlined,
                color: textColor,
              ),
              Text(localizations.navbar_following),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              const Icon(
                Icons.notifications_none_outlined,
                color: textColor,
              ),
              Text(localizations.navbar_notifications),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              const Icon(
                Icons.person_outline,
                color: textColor,
              ),
              Text(localizations.navbar_profile),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
