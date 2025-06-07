import 'package:community_with_legends_mobile/src/features/feed/domain/models/feed_posts_model.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/repositories/feed_repository.dart';

class GetPostsUseCase {
  final FeedRepository repository;

  GetPostsUseCase(this.repository);

  Future<FeedPosts> execute(int? page) {
    return repository.getPosts(page);
  }
}
