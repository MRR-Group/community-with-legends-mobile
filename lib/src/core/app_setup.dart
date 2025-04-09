import 'package:community_with_legends_mobile/src/features/auth/presentation/pages/login_page.dart';
import 'package:community_with_legends_mobile/src/features/auth/presentation/pages/register_page.dart';
import 'package:community_with_legends_mobile/src/features/feed/presentation/pages/feed_page.dart';

class AppSetup{
  static final routes = {
    '/login': (context) => LoginPage(),
    '/register': (context) => RegisterPage(),
    '/feed': (context) => const FeedPage(),
  };
}