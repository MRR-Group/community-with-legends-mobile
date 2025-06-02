import 'dart:async';

import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:community_with_legends_mobile/l10n/generated/app_localizations.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/background_image.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/button.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/default_app_bar.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/default_drawer.dart';
import 'package:flutter/material.dart';

class TwoFactoryAuthentication extends StatefulWidget {
  const TwoFactoryAuthentication({super.key});

  @override
  State<StatefulWidget> createState() => _TwoFactoryAuthenticationState();
}

class _TwoFactoryAuthenticationState extends State<TwoFactoryAuthentication> {
  int codeValiditySeconds = 10;
  late int secondsLeft;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    secondsLeft = codeValiditySeconds;
    startCountdown();
  }

  void startCountdown() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          secondsLeft--;
          if (secondsLeft <= 0) {
            timer.cancel();
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: const DefaultAppBar(),
      endDrawer: const DefaultDrawer(),
      body: Stack(
        children: [
          const BackgroundImage(bottomMargin: 0),
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 24),
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: secondaryGradient,
              ),
              child: Card(
                child: SizedBox(
                  width: 300,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 24,
                        children: [
                          Text(
                            localizations.tfa_title,
                            style: const TextStyle(
                              fontSize: 36,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            localizations.tfa_dontShareCode,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              color: backgroundLightColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                child: Text(
                                  secondsLeft > 0 ? '213769' : '------',
                                  style: const TextStyle(
                                    fontSize: 32,
                                    letterSpacing: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            secondsLeft > 0
                                ? '${localizations.tfa_codeExpiresIn} $secondsLeft'
                                : localizations.tfa_codeExpired,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          Button(
                            text: localizations.tfa_generateCode,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
