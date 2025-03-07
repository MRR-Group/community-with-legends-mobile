import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

enum AuthMode { login, register}

class AuthViaTwitch extends StatelessWidget {
  const AuthViaTwitch({super.key, required this.authMode});
  final AuthMode authMode;

  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          Text(
             "OR",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
            ),
          ),
          Text(
            authMode == AuthMode.login ? "Log in via" : "Register via",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
            ),
          ),
          SizedBox(height: 18),
          Image(image: Svg('assets/images/twitch.svg')),
        ],
      );
  }
}
