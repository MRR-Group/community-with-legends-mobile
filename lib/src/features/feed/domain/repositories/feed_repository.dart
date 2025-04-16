import 'package:community_with_legends_mobile/src/features/feed/domain/models/feed_posts_model.dart';

abstract class FeedRepository {
  Future<FeedPosts> getPosts();
  Future<List<String>> getFilteredGames(String filter);

  Future<void> createPost({
    required String content,
    int? gameId,
    List<int>? tagIds,
    int? assetId,
    String? assetLink,
  });
}
