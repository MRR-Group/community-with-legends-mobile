import 'package:community_with_legends_mobile/src/features/feed/domain/models/feed_posts_model.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/repositories/feed_repository.dart';

class GetFilteredPostsUseCase {
  final FeedRepository repository;

  GetFilteredPostsUseCase(this.repository);

  Future<FeedPosts> execute(int? tagId, int? gameId) {
    return repository.getFilteredPosts(tagId, gameId);
  }
}
