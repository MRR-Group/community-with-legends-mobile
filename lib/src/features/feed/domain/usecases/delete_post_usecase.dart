import 'package:community_with_legends_mobile/src/features/feed/domain/repositories/feed_repository.dart';

class DeletePostUseCase {
  final FeedRepository repository;

  DeletePostUseCase(this.repository);

  Future<void> execute(int postId) {
    return repository.deletePost(postId);
  }
}
