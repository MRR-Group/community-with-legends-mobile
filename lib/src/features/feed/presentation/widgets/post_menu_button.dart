import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/default_popup_menu_item.dart';
import 'package:flutter/material.dart';

class PostMenuButton extends StatelessWidget {
  const PostMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(
        Icons.more_horiz,
        color: textDisabledColor,
      ),
      itemBuilder: (context) => <PopupMenuEntry<String>>[
        DefaultPopupMenuItem.build(
          value: 'report',
          label: 'Report post',
          icon: Icons.flag,
        ),
        DefaultPopupMenuItem.build(
          value: 'delete',
          label: 'Delete post',
          icon: Icons.flag,
        ),
        DefaultPopupMenuItem.build(
          value: 'ban',
          label: 'Ban author',
          icon: Icons.flag,
        ),
      ],
    );
  }
}
