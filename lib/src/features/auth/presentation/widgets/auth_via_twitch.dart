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
          const Text(
             'OR',
            style: TextStyle(
              fontSize: 28,
            ),
          ),
          Text(
            authMode == AuthMode.login ? 'Log in via' : 'Register via',
            style: const TextStyle(
              fontSize: 28,
            ),
          ),
          const SizedBox(height: 18),
          const Image(image: Svg('assets/images/twitch.svg')),
        ],
      );
  }
}
