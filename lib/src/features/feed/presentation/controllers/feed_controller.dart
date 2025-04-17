import 'dart:async';

import 'package:community_with_legends_mobile/src/core/errors/exceptions/unauthenticated_exception.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/models/feed_posts_model.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/models/tag_model.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/usecases/create_post_usecase.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/usecases/get_filtered_games_usecase.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/usecases/get_posts_usecase.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/usecases/get_tags_usecase.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/game_model.dart';
import 'package:flutter/material.dart';

class FeedController extends ChangeNotifier {
  final GetPostsUseCase getPosts;
  final CreatePostUseCase createPost;
  final GetFilteredGamesUseCase getFilteredGames;
  final GetTagsUseCase getTags;

  FeedController(this.getPosts, this.createPost, this.getFilteredGames, this.getTags);

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  bool _isCreatingPost = false;

  bool get isCreatingPost => _isCreatingPost;

  FeedPosts? _feedPosts;

  FeedPosts? get feedPosts => _feedPosts;

  String? _error;

  String? get error => _error;

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
    } on UnauthenticatedException catch (_) {
      Navigator.pushReplacementNamed(context, '/login');
    } finally {
      _isCreatingPost = false;
      notifyListeners();

      loadPosts(context);
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
    required BuildContext context, required String filter,
  }) async {
    _error = null;
    print('loadingtags');
    try {
      return await getTags.execute(filter);
    } on UnauthenticatedException catch (_) {
      Navigator.pushReplacementNamed(context, '/login');
      return [];
    }
  }
}
