import 'package:community_with_legends_mobile/l10n/generated/app_localizations.dart';
import 'package:community_with_legends_mobile/src/core/errors/exceptions/http_exception.dart';
import 'package:community_with_legends_mobile/src/core/errors/exceptions/no_internet_exception.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/models/asset_types.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/models/feed_posts_model.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/models/tag_model.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/usecases/create_post_usecase.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/usecases/delete_post_usecase.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/usecases/get_filtered_posts_usecase.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/usecases/get_posts_usecase.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/usecases/get_trending_posts_usecase.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/usecases/report_post_usecase.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/game_model.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/post_model.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/alert.dart';
import 'package:flutter/material.dart';

class PostsController extends ChangeNotifier {
  final GetPostsUseCase getPostsUseCase;
  final GetTrendingPostsUsecase getTrendingPostsUseCase;
  final GetFilteredPostsUseCase getFilteredPostsUseCase;
  final CreatePostUseCase createPostUseCase;
  final ReportPostUseCase reportPostUseCase;
  final DeletePostUseCase deletePostUseCase;

  bool get isLoading => _isLoading;
  bool _isLoading = false;

  FeedPosts? get feedPosts => _feedPosts;
  FeedPosts? _feedPosts;

  bool get isCreatingPost => _isCreatingPost;
  bool _isCreatingPost = false;

  Tag? tagFilter;
  Game? gameFilter;

  GlobalKey<FormState>? formKey;
  String? postContent;
  Game? selectedGame;
  AssetType selectedAssetType = AssetType.image;
  String? assetLink;

  PostsController({
    required this.getPostsUseCase,
    required this.getTrendingPostsUseCase,
    required this.getFilteredPostsUseCase,
    required this.createPostUseCase,
    required this.reportPostUseCase,
    required this.deletePostUseCase,
  });

  Future<List<Post>> getPosts(int? page) async {
    final feedPosts = await  getPostsUseCase.execute(page);
    return feedPosts.posts;
  }

  Future<String> loadPosts(BuildContext context) async {
    _feedPosts = null;
    _isLoading = true;

    await Future.delayed(Duration.zero);
    notifyListeners();

    try {
      final localizations = AppLocalizations.of(context)!;
      _feedPosts = await getPostsUseCase.execute(null);

      if (_feedPosts?.posts != null && _feedPosts!.posts.isNotEmpty) {
        return localizations.posts_loaded;
      } else {
        return localizations.posts_noPosts;
      }
    } on HttpException catch (e) {
      return e.toString();
    } on NoInternetException catch (e) {
      return e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadTrendingPosts(BuildContext context) async {
    final localizations = AppLocalizations.of(context)!;
    _feedPosts = null;
    _isLoading = true;

    await Future.delayed(Duration.zero);
    notifyListeners();

    try {
      _feedPosts = await getTrendingPostsUseCase.execute();

      if (_feedPosts?.posts != null && _feedPosts!.posts.isNotEmpty) {
        Alert.of(context).show(text: localizations.posts_loaded);
      } else {
        Alert.of(context).show(text: localizations.posts_noPosts);
      }
    } on HttpException catch (e) {
      Alert.of(context).show(text: e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadFilteredPosts(BuildContext context) async {
    final localizations = AppLocalizations.of(context)!;
    _feedPosts = null;
    _isLoading = true;

    await Future.delayed(Duration.zero);
    notifyListeners();

    try {
      _feedPosts =
          await getFilteredPostsUseCase.execute(tagFilter?.id, gameFilter?.id);

      if (_feedPosts?.posts != null && _feedPosts!.posts.isNotEmpty) {
        Alert.of(context).show(text: localizations.posts_loaded);
      } else {
        Alert.of(context).show(text: localizations.posts_noPosts);
      }
    } on HttpException catch (e) {
      Alert.of(context).show(text: e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> submitPost({
    required BuildContext context,
    required List<int> selectedTagIds,
  }) async {
    final localizations = AppLocalizations.of(context)!;
    _isCreatingPost = true;

    notifyListeners();

    try {
      await createPostUseCase.execute(
        content: postContent!,
        gameId: selectedGame?.id,
        tagIds: selectedTagIds,
        assetId: selectedAssetType.id,
        assetLink: assetLink,
      );

      Alert.of(context).show(text: localizations.posts_postCreated);
    } on HttpException catch (e) {
      Alert.of(context).show(text: e.toString());
    } finally {
      _isCreatingPost = false;

      clearForm();
      loadPosts(context);
    }
  }

  void clearForm() {
    postContent = null;
    selectedGame = null;
    selectedAssetType = AssetType.image;
    assetLink = null;

    formKey?.currentState?.reset();

    notifyListeners();
  }

  Future<String> reportPost(BuildContext context, int postId) async {
    final localizations = AppLocalizations.of(context)!;

    try {
      await reportPostUseCase.execute(postId);
    } on HttpException catch (e) {
      return e.toString();
    } on NoInternetException catch (e) {
      return e.toString();
    }

    return localizations.posts_reported;
  }

  Future<String> deletePost(BuildContext context, int postId) async {
    final localizations = AppLocalizations.of(context)!;

    try {
      await deletePostUseCase.execute(postId);
    } on HttpException catch (e) {
      return e.toString();
    } on NoInternetException catch (e) {
      return e.toString();
    }

    loadPosts(context);
    return localizations.posts_deleted;
  }

  Future<String> handlePopupMenu(BuildContext context, String value, Post post) async {
    final localizations = AppLocalizations.of(context)!;

    switch(value){
      case 'report':
        return reportPost(context, post.id);
      case 'delete':
        return deletePost(context, post.id);
      default:
        return localizations.unexpectedError;
    }
  }
}
