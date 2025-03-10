import 'package:flutter/material.dart';

import '../../config/colors.dart';

class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AuthAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset("assets/images/logo.png"),
      centerTitle: true,
      leading: Padding(padding: EdgeInsets.only(bottom: 300)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
