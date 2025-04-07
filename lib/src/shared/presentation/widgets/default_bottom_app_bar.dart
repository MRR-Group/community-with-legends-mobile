import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:flutter/material.dart';

class DefaultBottomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const DefaultBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: backgroundColor,
      height: 55,
      padding: const EdgeInsets.only(left: 24, right: 24, top: 10),
      child: Row(
        children: [
          Container(
            child: const Column(
              children: [
                Icon(
                  Icons.public,
                  color: primaryColor,
                ),
                Text(
                  'Feed',
                  style: TextStyle(
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          const Column(
            children: [
              Icon(
                Icons.favorite_border_outlined,
                color: textColor,
              ),
              Text('Following'),
            ],
          ),
          const Spacer(),
          const Column(
            children: [
              Icon(
                Icons.notifications_none_outlined,
                color: textColor,
              ),
              Text('Notification'),
            ],
          ),
          const Spacer(),
          const Column(
            children: [
              Icon(
                Icons.person_outline,
                color: textColor,
              ),
              Text('Profile'),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
