import 'dart:async';

import 'package:community_with_legends_mobile/src/core/errors/exceptions/unauthenticated_exception.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/models/asset_types.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/models/feed_posts_model.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/models/tag_model.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/usecases/create_post_usecase.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/usecases/get_filtered_games_usecase.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/usecases/get_posts_usecase.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/usecases/get_tags_usecase.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/game_model.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/alert.dart';
import 'package:flutter/material.dart';

class FeedController extends ChangeNotifier {
  final GetPostsUseCase getPosts;
  final CreatePostUseCase createPost;
  final GetFilteredGamesUseCase getFilteredGames;
  final GetTagsUseCase getTags;

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

  FeedPosts? get feedPosts => _feedPosts;

  bool get isCreatingPost => _isCreatingPost;

  bool get isLoading => _isLoading;

  String? get error => _error;

  List<int> get selectedTagIds => selectedTags.map((tag) => tag.id).toList();

  FeedController(
    this.getPosts,
    this.createPost,
    this.getFilteredGames,
    this.getTags,
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
    } on UnauthenticatedException catch (_) {
      Navigator.pushReplacementNamed(context, '/login');
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
    } on UnauthenticatedException catch (_) {
      Navigator.pushReplacementNamed(context, '/login');
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
    } on UnauthenticatedException catch (_) {
      Navigator.pushReplacementNamed(context, '/login');
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
    } on UnauthenticatedException catch (_) {
      Navigator.pushReplacementNamed(context, '/login');
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
}
