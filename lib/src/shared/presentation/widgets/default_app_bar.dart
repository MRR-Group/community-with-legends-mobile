import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Image.asset("assets/images/logo.png"),
      ),
      shape: Border(
        bottom: BorderSide(color: textColor),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
