import 'package:community_with_legends_mobile/l10n/generated/app_localizations.dart';
import 'package:community_with_legends_mobile/src/core/errors/exceptions/http_exception.dart';
import 'package:community_with_legends_mobile/src/core/errors/exceptions/no_internet_exception.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/models/asset_types.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/models/feed_posts_model.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/models/tag_model.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/usecases/create_post_usecase.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/usecases/get_filtered_posts_usecase.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/usecases/get_posts_usecase.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/usecases/get_trending_posts_usecase.dart';
import 'package:community_with_legends_mobile/src/features/feed/presentation/controllers/tags_controller.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/game_model.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/alert.dart';
import 'package:flutter/material.dart';


class PostsController extends ChangeNotifier {
  final TagsController tagsController;
  final GetPostsUseCase getPosts;
  final GetTrendingPostsUsecase getTrendingPosts;
  final GetFilteredPostsUseCase getFilteredPosts;
  final CreatePostUseCase createPost;

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
    required this.tagsController,
    required this.getPosts,
    required this.getTrendingPosts,
    required this.getFilteredPosts,
    required this.createPost,
  });

  Future<String> loadPosts(BuildContext context) async {
    _feedPosts = null;
    _isLoading = true;

    await Future.delayed(Duration.zero);
    notifyListeners();

    try {
      final localizations = AppLocalizations.of(context)!;
      _feedPosts = await getPosts.execute();

      if (_feedPosts?.posts != null && _feedPosts!.posts.isNotEmpty) {
        return localizations.posts_loaded;
      } else {
        return localizations.posts_noPosts;
      }
    } on HttpException catch (e) {
      return e.toString();
    } on NoInternetException catch (e){
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
      _feedPosts = await getTrendingPosts.execute();

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
          await getFilteredPosts.execute(tagFilter?.id, gameFilter?.id);

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
  }) async {
    final localizations = AppLocalizations.of(context)!;
    _isCreatingPost = true;

    notifyListeners();

    try {
      await createPost.execute(
        content: postContent!,
        gameId: selectedGame?.id,
        tagIds: tagsController.selectedTagIds,
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

    tagsController.selectedTags.clear();
    formKey?.currentState?.reset();

    notifyListeners();
  }
}
