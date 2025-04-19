import 'package:community_with_legends_mobile/src/features/feed/domain/repositories/feed_repository.dart';

class AddReactionToPostUsecase {
  final FeedRepository repository;

  AddReactionToPostUsecase(this.repository);

  Future<void> execute(int postId) {
    return repository.addReactionToPost(postId);
  }
}
