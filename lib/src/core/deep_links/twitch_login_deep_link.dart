import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_links3/uni_links.dart';

class TwitchLoginDeepLink {
  StreamSubscription? _sub;
  String LOGIN_CALLBACK = 'logincallback';

  Future<void> registerLoginCallback(
    GlobalKey<NavigatorState> navigatorKey,
  ) async {
    _sub = uriLinkStream.listen(
      (Uri? uri) async {
        if (uri == null) {
          return;
        }
        final token = uri.queryParameters['token'];

        if (uri.host == LOGIN_CALLBACK && token != null) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('auth_token', token);

          navigatorKey.currentState?.pushReplacementNamed('/feed');
        }
      },
    );
  }
}
