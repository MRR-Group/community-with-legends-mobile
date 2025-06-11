import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:laravel_echo_null/laravel_echo_null.dart';
import 'package:pusher_client_socket/pusher_client_socket.dart' as pusher;

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();

  factory NotificationService() => _instance;

  NotificationService._internal();

  late Echo<pusher.PusherClient, Channel> echo;
  bool _initialized = false;

  void Function(String author)? onNewPost;

  void _handleNewPost(dynamic data) {
    final author = data['author_name'] ?? '???';

    if (onNewPost != null) {
      onNewPost!(author);
    }
  }

  void initialize(String token, int userId) {
    if (_initialized) {
      return;
    }

    _initialized = true;

    echo = Echo<pusher.PusherClient, Channel>(
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

    echo.channel('posts').listen('.post.created', _handleNewPost);
  }

  void disconnect() {
    if (_initialized) {
      echo.disconnect();
      _initialized = false;
    }
  }
}
