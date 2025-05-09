import 'package:community_with_legends_mobile/src/features/app_update/data/data_sources/update_datasource.dart';
import 'package:community_with_legends_mobile/src/features/app_update/data/repositories/update_repository_impl.dart';
import 'package:community_with_legends_mobile/src/features/app_update/domain/usecases/check_update_usecase.dart';
import 'package:community_with_legends_mobile/src/features/app_update/presentation/controllers/update_controller.dart';
import 'package:community_with_legends_mobile/src/features/app_update/presentation/widgets/update_page.dart';
import 'package:community_with_legends_mobile/src/features/auth/data/data_sources/auth_data_source.dart';
import 'package:community_with_legends_mobile/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:community_with_legends_mobile/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:community_with_legends_mobile/src/features/auth/domain/usecases/register_usecase.dart';
import 'package:community_with_legends_mobile/src/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:community_with_legends_mobile/src/features/auth/domain/usecases/send_reset_token_usecase.dart';
import 'package:community_with_legends_mobile/src/features/auth/presentation/controllers/login_controller.dart';
import 'package:community_with_legends_mobile/src/features/auth/presentation/controllers/register_controller.dart';
import 'package:community_with_legends_mobile/src/features/auth/presentation/controllers/reset_password_controller.dart';
import 'package:community_with_legends_mobile/src/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:community_with_legends_mobile/src/features/auth/presentation/pages/login_page.dart';
import 'package:community_with_legends_mobile/src/features/auth/presentation/pages/register_page.dart';
import 'package:community_with_legends_mobile/src/features/auth/presentation/pages/reset_password_page.dart';
import 'package:community_with_legends_mobile/src/features/feed/data/data_sources/feed_data_source.dart';
import 'package:community_with_legends_mobile/src/features/feed/data/repositories/feed_repository_impl.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/usecases/add_reaction_usecase.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/usecases/create_post_usecase.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/usecases/get_filtered_games_usecase.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/usecases/get_filtered_posts_usecase.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/usecases/get_posts_usecase.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/usecases/get_tags_usecase.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/usecases/get_trending_posts_usecase.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/usecases/remove_reaction_usecase.dart';
import 'package:community_with_legends_mobile/src/features/feed/presentation/controllers/games_controller.dart';
import 'package:community_with_legends_mobile/src/features/feed/presentation/controllers/post_tab_controller.dart';
import 'package:community_with_legends_mobile/src/features/feed/presentation/controllers/posts_controller.dart';
import 'package:community_with_legends_mobile/src/features/feed/presentation/controllers/reactions_controller.dart';
import 'package:community_with_legends_mobile/src/features/feed/presentation/controllers/tags_controller.dart';
import 'package:community_with_legends_mobile/src/features/feed/presentation/pages/feed_page.dart';
import 'package:community_with_legends_mobile/src/features/post_details/data/data_sources/post_details_datasource.dart';
import 'package:community_with_legends_mobile/src/features/post_details/data/repositories/post_details_repository_impl.dart';
import 'package:community_with_legends_mobile/src/features/post_details/domain/usecases/create_comment_usecase.dart';
import 'package:community_with_legends_mobile/src/features/post_details/domain/usecases/get_post_usecase.dart';
import 'package:community_with_legends_mobile/src/features/post_details/presentation/controllers/post_details_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppSetup {
  static final AppSetup _instance = AppSetup._internal();

  factory AppSetup() {
    return _instance;
  }

  AppSetup._internal();

  String get apiUrl => dotenv.env['API_URL']!;

  String get updateChecking => dotenv.env['CHECK_UPDATE']!;

  String get updateUrl => dotenv.env['UPDATE_URL']!;

  bool _updateAvailable = false;

  bool get updateAvailable => _updateAvailable;

  final Map<String, WidgetBuilder> routes = {
    '/login': (context) => LoginPage(),
    '/register': (context) => RegisterPage(),
    '/feed': (context) => FeedPage(),
    '/forgot-password': (context) => ForgotPasswordPage(),
    '/reset-password': (context) => ResetPasswordPage(),
    '/update': (context) => const UpdatePage(versionInfo: null),
  };

  Future<void> checkUpdate(BuildContext context) async {
    final updateController = createUpdateController();
    final availableUpdate = await updateController.updateAvailable();

    if (availableUpdate != null) {
      routes['/update'] = (context) => UpdatePage(versionInfo: availableUpdate);

      _updateAvailable = true;
    }
  }

  LoginController createLoginController() {
    final api = AuthDataSource(baseUrl: apiUrl);
    final repository = AuthRepositoryImpl(api);

    final loginUseCase = LoginUseCase(repository);

    return LoginController(loginUseCase);
  }

  RegisterController createRegisterController() {
    final api = AuthDataSource(baseUrl: apiUrl);
    final repository = AuthRepositoryImpl(api);

    final registerUseCase = RegisterUseCase(repository);

    return RegisterController(registerUseCase);
  }

  ResetPasswordController createPasswordResetController() {
    final api = AuthDataSource(baseUrl: apiUrl);
    final repository = AuthRepositoryImpl(api);

    final sendResetTokenUsecase = SendResetTokenUsecase(repository);
    final resetPasswordUsecase = ResetPasswordUsecase(repository);

    return ResetPasswordController(sendResetTokenUsecase, resetPasswordUsecase);
  }

  GamesController createGamesController() {
    final feedApi = FeedDataSource(baseUrl: apiUrl);
    final feedRepository = FeedRepositoryImpl(feedApi);

    final getFilteredGamesUseCase = GetFilteredGamesUseCase(feedRepository);

    return GamesController(
      getFilteredGamesUseCase,
    );
  }

  PostTabController createPostTabController(PostsController postsController) {
    return PostTabController(postsController);
  }

  PostsController createPostsController() {
    final feedApi = FeedDataSource(baseUrl: apiUrl);
    final feedRepository = FeedRepositoryImpl(feedApi);

    final getPostsUseCase = GetPostsUseCase(feedRepository);
    final getTrendingPosts = GetTrendingPostsUsecase(feedRepository);
    final getFilteredPostsUseCase = GetFilteredPostsUseCase(feedRepository);
    final createPostUseCase = CreatePostUseCase(feedRepository);

    return PostsController(
      tagsController: createTagsController(),
      createPost: createPostUseCase,
      getPosts: getPostsUseCase,
      getFilteredPosts: getFilteredPostsUseCase,
      getTrendingPosts: getTrendingPosts,
    );
  }

  ReactionsController createReactionsController() {
    final feedApi = FeedDataSource(baseUrl: apiUrl);
    final feedRepository = FeedRepositoryImpl(feedApi);

    final addReactionToPostUsecase = AddReactionToPostUsecase(feedRepository);
    final removeReactionFromPostUsecase =
    RemoveReactionFromPostUsecase(feedRepository);

    return ReactionsController(
      addReactionToPost: addReactionToPostUsecase,
      removeReactionFromPost: removeReactionFromPostUsecase,
    );
  }

  TagsController createTagsController() {
    final feedApi = FeedDataSource(baseUrl: apiUrl);
    final feedRepository = FeedRepositoryImpl(feedApi);

    final getTagsUseCase = GetTagsUseCase(feedRepository);

    return TagsController(
      getTagsUseCase,
    );
  }

  PostDetailsController createPostDetailsController() {
    final api = PostDetailsDatasource(baseUrl: apiUrl);
    final repository = PostDetailsRepositoryImpl(api);

    final getPostUsecase = GetPostUsecase(repository);
    final createCommentUsecase = CreateCommentUsecase(repository);

    return PostDetailsController(getPostUsecase, createCommentUsecase);
  }

  UpdateController createUpdateController() {
    final datasource = UpdateDatasource(updateUrl);
    final repository = UpdateRepositoryImpl(datasource);

    final checkUpdateUsecase = CheckUpdateUsecase(repository);

    return UpdateController(checkUpdateUsecase);
  }

  List<SingleChildWidget> getProviders() {
    final postsController = createPostsController();
    return [
      ChangeNotifierProvider<LoginController>(
        create: (_) => createLoginController(),
      ),
      ChangeNotifierProvider<RegisterController>(
        create: (_) => createRegisterController(),
      ),
      ChangeNotifierProvider<GamesController>(
        create: (_) => createGamesController(),
      ),
      ChangeNotifierProvider<PostTabController>(
        create: (_) => PostTabController(postsController),
      ),
      ChangeNotifierProvider<PostsController>(
        create: (_) => postsController,
      ),
      ChangeNotifierProvider<ReactionsController>(
        create: (_) => createReactionsController(),
      ),
      ChangeNotifierProvider<TagsController>(
        create: (_) => createTagsController(),
      ),
      ChangeNotifierProvider<UpdateController>(
        create: (_) => createUpdateController(),
      ),
      ChangeNotifierProvider<ResetPasswordController>(
        create: (_) => createPasswordResetController(),
      ),
      ChangeNotifierProvider<PostDetailsController>(
        create: (_) => createPostDetailsController(),
      ),
    ];
  }
}
