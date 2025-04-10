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
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';


class AppSetup{
  static final AppSetup _instance = AppSetup._internal();

  factory AppSetup() {
    return _instance;
  }

  AppSetup._internal();

  String get apiUrl => dotenv.env['API_URL']!;

  final Map<String, WidgetBuilder> routes = {
    '/login': (context) => LoginPage(),
    '/register': (context) => RegisterPage(),
    '/feed': (context) => const FeedPage(),
  };

  LoginController createLoginController(){
    final api = AuthApi(apiUrl);
    final repository = AuthRepositoryImpl(api);
    final loginUseCase = LoginUseCase(repository);
    return LoginController(loginUseCase);
  }

  RegisterController createRegisterController(){
    final api = AuthApi(apiUrl);
    final repository = AuthRepositoryImpl(api);
    final registerUseCase = RegisterUseCase(repository);
    return RegisterController(registerUseCase);
  }

  FeedController createFeedController(){
    final feedApi = FeedApi(apiUrl);
    final feedRepository = FeedRepositoryImpl(feedApi);
    final getPostsUseCase = GetPostsUseCase(feedRepository);
    return FeedController(getPostsUseCase);
  }

  List<SingleChildWidget> getProviders(){
    return [
      ChangeNotifierProvider<LoginController>(
        create: (_) => createLoginController(),
      ),
      ChangeNotifierProvider<RegisterController>(
        create: (_) => createRegisterController(),
      ),
      ChangeNotifierProvider<FeedController>(
        create: (_) => createFeedController(),
      ),
    ];
  }

}
