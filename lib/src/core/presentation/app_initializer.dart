import 'package:community_with_legends_mobile/config/theme.dart';
import 'package:community_with_legends_mobile/src/core/app_setup.dart';
import 'package:community_with_legends_mobile/src/core/errors/exceptions/check_update_exception.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/alert.dart';
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
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  bool _initialized = false;
  String initialRoute = '/feed';
  String? _error;

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
    try {
      await widget.appSetup.checkUpdate(context);
    } on CheckUpdateException catch (e) {
      _error = e.toString();
    }

    setState(() {
      initialRoute = getRoute();
      _initialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final app = MaterialApp(
      navigatorKey: _navigatorKey,
      title: 'Community with Legends',
      debugShowCheckedModeBanner: false,
      theme: theme,
      routes: widget.appSetup.routes,
      home: _initialized
          ? widget.appSetup.routes[initialRoute]!(context)
          : const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
    );

    if (_initialized && _error != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final scaffoldContext = _navigatorKey.currentContext;
        if (scaffoldContext != null) {
          Alert.of(scaffoldContext).show(text: _error!);
        }
      });
    }

    return app;
  }
}
