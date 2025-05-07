import 'package:community_with_legends_mobile/src/features/feed/domain/models/feed_posts_model.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/repositories/feed_repository.dart';

class GetTrendingPostsUsecase{
  final FeedRepository repository;

  GetTrendingPostsUsecase(this.repository);

  Future<FeedPosts> execute() {
    return repository.getTrendingPosts();
  }
}
