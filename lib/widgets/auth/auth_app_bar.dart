import 'package:flutter/material.dart';

class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AuthAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //title: Image(image: Svg('lib/assets/images/twitch.svg')),
      title: Image.asset("lib/assets/images/logo.png"),
      centerTitle: true,
      backgroundColor: Color(0xFF181719),
      leading: Padding(padding: EdgeInsets.only(bottom: 300)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
