import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:url_launcher/url_launcher.dart';

enum AuthMode { login, register }

class AuthViaTwitch extends StatelessWidget {
  const AuthViaTwitch({super.key, required this.authMode});

  final AuthMode authMode;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        InkWell(
          child: const Image(
            image: Svg('assets/images/twitch.svg'),
          ),
          onTap: () => {
            launchUrl(Uri.parse(
                'https://id.twitch.tv/oauth2/authorize?response_type=code&client_id=y0ovshk37zeusj60u8vzv176tojtm5&redirect_uri=https://napalonaemi.pl/api/twitch/auth/login&scope=user%3Aread%3Aemail')),
          },
        ),
      ],
    );
  }
}
