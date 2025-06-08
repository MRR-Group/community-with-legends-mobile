import 'package:community_with_legends_mobile/src/core/app_setup.dart';
import 'package:community_with_legends_mobile/src/core/presentation/app_initializer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  final prefs = await SharedPreferences.getInstance();
  final hasAuthToken = prefs.getString('auth_token') != null;

  runApp(
    MyApp(
      hasAuthToken: hasAuthToken,
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool hasAuthToken;
  final AppSetup appSetup = AppSetup();

  MyApp({super.key, required this.hasAuthToken});

  @override
  Widget build(
    BuildContext context,
  ) {
    return MultiProvider(
      providers: appSetup.getProviders(),
      child: AppInitializer(
        appSetup: appSetup,
        hasAuthToken: hasAuthToken,
      ),
    );
  }
}
