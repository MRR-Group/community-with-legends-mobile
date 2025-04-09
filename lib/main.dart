import 'package:community_with_legends_mobile/config/theme.dart';
import 'package:community_with_legends_mobile/src/core/app_setup.dart';
import 'package:community_with_legends_mobile/src/features/auth/data/data_sources/auth_api.dart';
import 'package:community_with_legends_mobile/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:community_with_legends_mobile/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:community_with_legends_mobile/src/features/auth/domain/usecases/register_usecase.dart';
import 'package:community_with_legends_mobile/src/features/auth/presentation/controllers/login_controller.dart';
import 'package:community_with_legends_mobile/src/features/auth/presentation/controllers/register_controller.dart';
import 'package:community_with_legends_mobile/src/features/auth/presentation/pages/login_page.dart';
import 'package:community_with_legends_mobile/src/features/auth/presentation/pages/register_page.dart';
import 'package:community_with_legends_mobile/src/features/feed/data/data_sources/feed_api.dart';
import 'package:community_with_legends_mobile/src/features/feed/data/repositories/feed_repository_impl.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/usecases/get_posts_usecase.dart';
import 'package:community_with_legends_mobile/src/features/feed/presentation/controllers/feed_controller.dart';
import 'package:community_with_legends_mobile/src/features/feed/presentation/pages/feed_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  final prefs = await SharedPreferences.getInstance();
  final hasAuthToken = prefs.getString('auth_token') != null;

  runApp(MyApp(hasAuthToken: hasAuthToken,));
}

class MyApp extends StatelessWidget {
  final bool hasAuthToken;

  const MyApp({super.key, required this.hasAuthToken});


  @override
  Widget build(BuildContext context,) {
    final api = AuthApi(dotenv.env['API_URL']!);
    final repository = AuthRepositoryImpl(api);
    final loginUseCase = LoginUseCase(repository);
    final loginController = LoginController(loginUseCase);
    final registerUseCase = RegisterUseCase(repository);
    final registerController = RegisterController(registerUseCase);
    final feedApi = FeedApi(dotenv.env['API_URL']!);
    final feedRepository = FeedRepositoryImpl(feedApi);
    final getPostsUseCase = GetPostsUseCase(feedRepository);
    final feedController = FeedController(getPostsUseCase);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginController>(
          create: (_) => loginController,
        ),
        ChangeNotifierProvider<RegisterController>(
          create: (_) => registerController,
        ),
        ChangeNotifierProvider<FeedController>(
          create: (_) => feedController,
        ),
      ],
      child: MaterialApp(
        title: 'Community with Legends',
        debugShowCheckedModeBanner: false,
        theme: theme,
        initialRoute: hasAuthToken ? '/feed' : '/login',
        routes: AppSetup.routes,
      ),
    );
  }
}
