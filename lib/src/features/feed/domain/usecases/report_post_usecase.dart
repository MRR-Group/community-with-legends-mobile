import 'package:community_with_legends_mobile/src/features/feed/domain/repositories/feed_repository.dart';

class ReportPostUseCase {
  final FeedRepository repository;

  ReportPostUseCase(this.repository);

  Future<void> execute(int postId) {
    return repository.reportPost(postId);
  }
}
