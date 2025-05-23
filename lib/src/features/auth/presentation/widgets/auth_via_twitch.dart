import 'package:community_with_legends_mobile/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:url_launcher/url_launcher.dart';

enum AuthMode { login, register }

class AuthViaTwitch extends StatelessWidget {
  final AuthMode authMode;
  final String _twitchLoginUrl = dotenv.env['TWITCH_LOGIN_URL'] ?? '';
  final String _twitchRegisterUrl = dotenv.env['TWITCH_REGISTER_URL'] ?? '';

  String  _authText(AppLocalizations localizations) =>
      authMode == AuthMode.login ? localizations.login_loginVia : localizations.register_registerVia;

  String get _authLink =>
      authMode == AuthMode.login ? _twitchLoginUrl : _twitchRegisterUrl;

  AuthViaTwitch({super.key, required this.authMode});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Column(
      children: [
        Text(
          localizations.login_or,
          style: const TextStyle(
            fontSize: 28,
          ),
        ),
        Text(
          _authText(localizations),
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
