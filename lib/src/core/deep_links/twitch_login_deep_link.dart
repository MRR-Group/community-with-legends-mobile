import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_links3/uni_links.dart';

class TwitchLoginDeepLink {
  final _loginCallback = 'logincallback';

  Future<void> registerLoginCallback(
    GlobalKey<NavigatorState> navigatorKey,
  ) async {
    uriLinkStream.listen(
      (Uri? uri) async {
        if (uri == null) {
          return;
        }
        final token = uri.queryParameters['token'];

        if (uri.host == _loginCallback && token != null) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('auth_token', token);

          navigatorKey.currentState?.pushReplacementNamed('/feed');
        }
      },
    );
  }
}
