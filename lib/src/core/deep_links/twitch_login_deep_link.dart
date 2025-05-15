import 'dart:async';

import 'package:community_with_legends_mobile/src/shared/presentation/widgets/alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_links3/uni_links.dart';

class TwitchLoginDeepLink {
  static const _loginCallback = 'logincallback';
  static const _messageCallback = 'messagecallback';

  Future<void> registerLoginCallback(
    GlobalKey<NavigatorState> navigatorKey,
  ) async {
    uriLinkStream.listen(
      (Uri? uri) async {
        if (uri == null) {
          return;
        }
        switch (uri.host) {
          case _loginCallback:
            final token = uri.queryParameters['token'];
            _login(navigatorKey, token);
            break;
          case _messageCallback:
            final message = uri.queryParameters['message'];
            _showMessage(navigatorKey, message);
            break;
        }
      },
    );
  }

  Future<void> _login(
    GlobalKey<NavigatorState> navigatorKey,
    String? token,
  ) async {
    final context = navigatorKey.currentContext;

    if (token != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', token);

      navigatorKey.currentState?.pushReplacementNamed('/feed');

      _showAlert(context, 'Logged in via Twitch');
    } else {
      _showAlert(context, 'Something went wrong. Try again later');
    }
  }

  void _showMessage(GlobalKey<NavigatorState> navigatorKey, String? message) {
    final context = navigatorKey.currentContext;

    if (message != null) {
      _showAlert(context, message);
    }
  }

  void _showAlert(BuildContext? context, String message) {
    if (context != null) {
      Alert.of(context).show(text: message);
    }
  }
}
