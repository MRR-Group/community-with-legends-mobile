import 'package:community_with_legends_mobile/src/shared/presentation/widgets/alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:laravel_echo_null/laravel_echo_null.dart';
import 'package:pusher_client_socket/pusher_client_socket.dart' as PUSHER;

class PusherService {
  static final PusherService _instance = PusherService._internal();

  factory PusherService() => _instance;

  PusherService._internal();

  late Echo<PUSHER.PusherClient, Channel> echo;
  bool _initialized = false;

  void initialize(String token, int userId) {
    if (_initialized) {
      return;
    }
    _initialized = true;
    echo = Echo<PUSHER.PusherClient, Channel>(
      PusherConnector(
        dotenv.env['PUSHER_API_KEY']!,
        host: 'ws-eu.pusher.com',
        authEndPoint: 'https://cwl.legnica.pl/api/broadcasting/auth',
        authHeaders: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        cluster: 'eu',
      ),
    );

    echo.connect();

    echo.connector.onConnect((e) {
      debugPrint('Connected to pusher: $e');
    });

    echo.connector.onError((error) {
      debugPrint('Błąd Pusher: $error');
    });

    echo.connector.onDisconnect((_) {
      debugPrint('Rozłączono z Pusherem!');
    });

    echo.channel('public-posts').listen('.post.created', (data) {
      debugPrint('Received .post.created event: $data');
      Alert.showGlobal(text: 'Użytkownik ${data['author_name']} dodał nowy post');
    });
  }

  void disconnect() {
    if (_initialized) {
      echo.disconnect();
      _initialized = false;
    }
  }
}
