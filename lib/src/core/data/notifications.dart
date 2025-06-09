import 'package:community_with_legends_mobile/src/shared/presentation/widgets/alert.dart';
import 'package:laravel_echo_null/laravel_echo_null.dart';
import 'package:pusher_client_socket/pusher_client_socket.dart' as PUSHER;

class PusherService {
  static final PusherService _instance = PusherService._internal();

  factory PusherService() => _instance;

  PusherService._internal();

  late Echo<PUSHER.PusherClient, Channel> echo;
  bool _initialized = false;

  void initialize(String token, int userId) {
    print('initializing');
    if (_initialized) {
      return;
    }
    _initialized = true;
    print('connecting to token: $token, userid: $userId');
    echo = Echo<PUSHER.PusherClient, Channel>(
      PusherConnector(
        'xxx', // todo change to env apikey
        authEndPoint: 'https://cwl.legnica.pl/api/broadcasting/auth',
        authHeaders: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        cluster: 'eu',
      ),
    );

    echo.connect();

    final channel = echo.private('user.$userId');

    channel.listen('proposal.added', (data) {
      print('event: $data');
      Alert.showGlobal(text: 'Nowa propozycja: ${data.toString()}');
    });
    channel.listen('pusher:subscription_succeeded', (_) {
      print('Subscribed to channel successfully');
    });

    channel.listen('pusher:subscription_error', (error) {
      print('Subscription error: $error');
    });

    print('Subscribed to private-user.1 channel: $channel');
    print('State: ${echo.socketId} ');
  }

  void disconnect() {
    if (_initialized) {
      echo.disconnect();
      _initialized = false;
    }
  }
}
