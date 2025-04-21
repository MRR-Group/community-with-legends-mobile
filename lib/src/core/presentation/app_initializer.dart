import 'package:community_with_legends_mobile/config/theme.dart';
import 'package:community_with_legends_mobile/src/core/app_setup.dart';
import 'package:flutter/material.dart';

class AppInitializer extends StatefulWidget {
  final AppSetup appSetup;
  final bool hasAuthToken;

  const AppInitializer({
    super.key,
    required this.appSetup,
    required this.hasAuthToken,
  });

  @override
  State<StatefulWidget> createState() => _AppInitializerState();
}

class _AppInitializerState extends State<AppInitializer> {
  bool _initialized = false;
  String initialRoute = '/feed';

  String getRoute() {
    if (widget.appSetup.updateAvailable) {
      return '/update';
    } else if (widget.hasAuthToken) {
      return '/feed';
    }

    return '/login';
  }

  @override
  void initState() {
    super.initState();
    _initAsync();
  }

  Future<void> _initAsync() async {
    await widget.appSetup.checkUpdate();
    setState(() {
      initialRoute = getRoute();
      _initialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      return const MaterialApp(
        home: Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
      );
    }
    return MaterialApp(
      title: 'Community with Legends',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: widget.appSetup.routes[initialRoute]!(context),
    );
  }
}
