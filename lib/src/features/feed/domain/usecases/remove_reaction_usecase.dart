import 'package:community_with_legends_mobile/src/features/feed/domain/repositories/feed_repository.dart';

class RemoveReactionFromPostUsecase {
  final FeedRepository repository;

  RemoveReactionFromPostUsecase(this.repository);

  Future<void> execute(int postId) {
    return repository.removeReactionFromPost(postId);
  }
}
