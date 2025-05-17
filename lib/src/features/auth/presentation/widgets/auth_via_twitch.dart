import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:url_launcher/url_launcher.dart';

enum AuthMode { login, register }

class AuthViaTwitch extends StatelessWidget {
  final AuthMode authMode;
  final String _twitchLoginUrl = dotenv.env['TWITCH_LOGIN_URL'] ?? '';
  final String _twitchRegisterUrl = dotenv.env['TWITCH_REGISTER_URL'] ?? '';

  String get _authText =>
      authMode == AuthMode.login ? 'Log in via' : 'Register via';

  String get _authLink =>
      authMode == AuthMode.login ? _twitchLoginUrl : _twitchRegisterUrl;

  AuthViaTwitch({super.key, required this.authMode});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Column(
      children: [
        Text(
          localizations.loginOr,
          style: const TextStyle(
            fontSize: 28,
          ),
        ),
        Text(
          authMode == AuthMode.login ? localizations.loginLoginVia : localizations.registerVia,
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
            launchUrl(
              Uri.parse(
                _authLink,
              ),
            ),
          },
        ),
      ],
    );
  }
}
