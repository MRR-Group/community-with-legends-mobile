import 'dart:async';
import 'dart:io';

import 'package:community_with_legends_mobile/src/features/feed/domain/models/asset_types.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/models/feed_posts_model.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/models/post_tab.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/models/tag_model.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/usecases/add_reaction_usecase.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/usecases/create_post_usecase.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/usecases/get_filtered_games_usecase.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/usecases/get_filtered_posts_usecase.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/usecases/get_posts_usecase.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/usecases/get_tags_usecase.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/usecases/get_trending_posts_usecase.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/usecases/remove_reaction_usecase.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/game_model.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/post_model.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/alert.dart';
import 'package:flutter/material.dart';

class FeedController extends ChangeNotifier {
  final GetPostsUseCase getPosts;
  final GetTrendingPostsUsecase getTrendingPosts;
  final GetFilteredPostsUseCase getFilteredPosts;
  final CreatePostUseCase createPost;
  final GetFilteredGamesUseCase getFilteredGames;
  final GetTagsUseCase getTags;
  final AddReactionToPostUsecase addReactionToPost;
  final RemoveReactionFromPostUsecase removeReactionFromPost;

  FeedPosts? _feedPosts;

  bool _isCreatingPost = false;
  bool _isLoading = false;
  String? _error;

  GlobalKey<FormState>? formKey;
  String? postContent;
  Game? selectedGame;
  List<Tag> selectedTags = [];
  AssetType selectedAssetType = AssetType.image;
  String? assetLink;
  Tag? tagFilter;
  Game? gameFilter;
  PostTab _selectedPostTab = PostTab.recent;

  PostTab get selectedPostTab => _selectedPostTab;

  FeedPosts? get feedPosts => _feedPosts;

  bool get isCreatingPost => _isCreatingPost;

  bool get isLoading => _isLoading;

  String? get error => _error;

  List<int> get selectedTagIds => selectedTags.map((tag) => tag.id).toList();

  FeedController(
    this.getPosts,
    this.getTrendingPosts,
    this.getFilteredPosts,
    this.createPost,
    this.getFilteredGames,
    this.getTags,
    this.addReactionToPost,
    this.removeReactionFromPost,
  );

  Future<void> submitPost({
    required BuildContext context,
    required String content,
    int? gameId,
    List<int>? tagIds,
    int? assetId,
    String? assetLink,
  }) async {
    _error = null;
    _isCreatingPost = true;

    notifyListeners();

    try {
      await createPost.execute(
        content: content,
        gameId: gameId,
        tagIds: tagIds,
        assetId: assetId,
        assetLink: assetLink,
      );

      Alert.of(context).show(text: 'Post has been created');
    } on HttpException catch (e) {
      Navigator.pushReplacementNamed(context, '/login');
      Alert.of(context).show(text: e.toString());
    } finally {
      _isCreatingPost = false;

      clearForm();
      loadPosts(context);
    }
  }

  Future<void> loadPosts(BuildContext context) async {
    _error = null;
    _feedPosts = null;
    _isLoading = true;

    await Future.delayed(Duration.zero);
    notifyListeners();

    try {
      _feedPosts = await getPosts.execute();

      if (_feedPosts?.posts != null && _feedPosts!.posts.isNotEmpty) {
        Alert.of(context).show(text: 'Posts loaded successfully.');
      } else {
        Alert.of(context).show(text: 'No posts available.');
      }
    } on HttpException catch (e) {
      Navigator.pushReplacementNamed(context, '/login');
      Alert.of(context).show(text: e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadTrendingPosts(BuildContext context) async {
    _error = null;
    _feedPosts = null;
    _isLoading = true;

    await Future.delayed(Duration.zero);
    notifyListeners();

    try {
      _feedPosts = await getTrendingPosts.execute();

      if (_feedPosts?.posts != null && _feedPosts!.posts.isNotEmpty) {
        Alert.of(context).show(text: 'Posts loaded successfully.');
      } else {
        Alert.of(context).show(text: 'No posts available.');
      }
    } on HttpException catch (e) {
      Navigator.pushReplacementNamed(context, '/login');
      Alert.of(context).show(text: e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadFilteredPosts(BuildContext context) async {
    _error = null;
    _feedPosts = null;
    _isLoading = true;

    await Future.delayed(Duration.zero);
    notifyListeners();

    try {
      _feedPosts =
          await getFilteredPosts.execute(tagFilter?.id, gameFilter?.id);

      if (_feedPosts?.posts != null && _feedPosts!.posts.isNotEmpty) {
        Alert.of(context).show(text: 'Posts loaded successfully.');
      } else {
        Alert.of(context).show(text: 'No posts available.');
      }
    } on HttpException catch (e) {
      Navigator.pushReplacementNamed(context, '/login');
      Alert.of(context).show(text: e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  FutureOr<List<Game>> loadFilteredGames({
    required BuildContext context,
    required String filter,
  }) async {
    _error = null;

    try {
      return await getFilteredGames.execute(filter);
    } on HttpException catch (e) {
      Navigator.pushReplacementNamed(context, '/login');
      Alert.of(context).show(text: e.toString());
      return [];
    }
  }

  FutureOr<List<Tag>> loadTags({
    required BuildContext context,
    required String filter,
  }) async {
    _error = null;

    try {
      return await getTags.execute(filter);
    } on HttpException catch (e) {
      Navigator.pushReplacementNamed(context, '/login');
      Alert.of(context).show(text: e.toString());
      return [];
    }
  }

  void addTag(Tag newTag) {
    final alreadySelected = selectedTags.any((tag) => tag.id == newTag.id);

    if (!alreadySelected) {
      selectedTags.add(newTag);
      notifyListeners();
    }
  }

  void removeTag(Tag tag) {
    selectedTags.remove(tag);
    notifyListeners();
  }

  void clearForm() {
    postContent = null;
    selectedGame = null;
    selectedAssetType = AssetType.image;
    assetLink = null;

    selectedTags.clear();
    formKey?.currentState?.reset();

    notifyListeners();
  }

  Future<void> addReaction(BuildContext context, Post post) async {
    try {
      await addReactionToPost.execute(post.id);

      post.reactionsCount++;
      post.userReacted = true;
    } on HttpException catch (e) {
      Navigator.pushReplacementNamed(context, '/login');
      Alert.of(context).show(text: e.toString());
    } finally {
      notifyListeners();
    }
  }

  Future<void> removeReaction(BuildContext context, Post post) async {
    try {
      await removeReactionFromPost.execute(post.id);

      post.reactionsCount--;
      post.userReacted = false;
    } on HttpException catch (e) {
      Navigator.pushReplacementNamed(context, '/login');
      Alert.of(context).show(text: e.toString());
    } finally {
      notifyListeners();
    }
  }

  void selectPostTab(BuildContext context, PostTab postTab) {
    switch (postTab) {
      case PostTab.trending:
        _selectedPostTab = PostTab.trending;
        loadTrendingPosts(context);
        break;
      case PostTab.recent:
        _selectedPostTab = PostTab.recent;
        loadPosts(context);
        break;
      case PostTab.filtered:
        _selectedPostTab = PostTab.filtered;
        break;
    }
  }
}
