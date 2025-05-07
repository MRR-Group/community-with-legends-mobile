import 'package:community_with_legends_mobile/src/features/feed/domain/models/feed_posts_model.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/models/tag_model.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/game_model.dart';

abstract class FeedRepository {
  Future<FeedPosts> getPosts();
  Future<FeedPosts> getFilteredPosts(int? tagId, int? gameId);
  Future<List<Game>> getFilteredGames(String filter);
  Future<List<Tag>> getTags(String filter);
  Future<void> addReactionToPost(int postId);
  Future<void> removeReactionFromPost(int postId);

  Future<void> createPost({
    required String content,
    int? gameId,
    List<int>? tagIds,
    int? assetId,
    String? assetLink,
  });

}
