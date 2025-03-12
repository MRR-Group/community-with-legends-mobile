import 'package:community_with_legends_mobile/src/features/auth/data/data_sources/auth_api.dart';
import 'package:community_with_legends_mobile/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:community_with_legends_mobile/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:community_with_legends_mobile/src/features/auth/domain/usecases/register_usecase.dart';
import 'package:community_with_legends_mobile/src/features/auth/presentation/controllers/login_controller.dart';
import 'package:community_with_legends_mobile/src/features/auth/presentation/controllers/register_controller.dart';
import 'package:community_with_legends_mobile/src/features/auth/presentation/pages/login_page.dart';
import 'package:community_with_legends_mobile/src/features/auth/presentation/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'config/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final api = AuthApi(dotenv.env['API_URL']!);
    final repository = AuthRepositoryImpl(api);
    final loginUseCase = LoginUseCase(repository);
    final loginController = LoginController(loginUseCase);
    final registerUseCase = RegisterUseCase(repository);
    final registerController = RegisterController(registerUseCase);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginController>(
          create: (_) => loginController,
        ),
        ChangeNotifierProvider<RegisterController>(
          create: (_) => registerController,
        ),
      ],
      child: MaterialApp(
        title: 'Community with Legends',
        debugShowCheckedModeBanner: false,
        theme: theme,
        initialRoute: '/login',
        routes: {
          '/login': (context) => LoginPage(),
          '/register': (context) => RegisterPage(),
        },
      ),
    );
  }
}
