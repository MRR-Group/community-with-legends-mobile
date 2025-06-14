import 'package:community_with_legends_mobile/src/features/feed/data/data_sources/feed_data_source.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/models/feed_posts_model.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/models/tag_model.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/repositories/feed_repository.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/game_model.dart';

class FeedRepositoryImpl implements FeedRepository {
  final FeedDataSource api;

  FeedRepositoryImpl(this.api);

  @override
  Future<FeedPosts> getPosts(int? page) async {
    final response = await api.getPosts(page);

    try {
      final result = FeedPosts.fromJson(response);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<FeedPosts> getTrendingPosts() async {
    final response = await api.getTrendingPosts();

    try {
      final result = FeedPosts.fromJson(response);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<FeedPosts> getFilteredPosts(int? tagId, int? gameId) async {
    final response = await api.getFilteredPosts(tagId, gameId);

    try {
      final result = FeedPosts.fromJson(response);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Game>> getFilteredGames(String filter) async {
    final response = await api.getFilteredGames(filter);

    try {
      final result = (response['data'] as List<dynamic>)
          .map((gamesData) => Game.fromJson(gamesData))
          .toList();

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Tag>> getTags(String filter) async {
    final response = await api.getTags(filter);

    try {
      final result = (response['data'] as List<dynamic>)
          .map((tags) => Tag.fromJson(tags))
          .toList();

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> createPost({
    required String content,
    int? gameId,
    List<int>? tagIds,
    int? assetId,
    String? assetLink,
  }) async {
    await api.createPost(
      content: content,
      gameId: gameId,
      tagIds: tagIds,
      assetId: assetId,
      assetLink: assetLink,
    );
  }

  @override
  Future<void> addReactionToPost(int postId) async{
    await api.addPostReaction(postId);
  }

  @override
  Future<void> removeReactionFromPost(int postId) async{
    await api.removePostReaction(postId);
  }

  @override
  Future<void> reportPost(int postId) async{
    await api.reportPost(postId);
  }

  @override
  Future<void> deletePost(int postId) async{
    await api.deletePost(postId);
  }
}
