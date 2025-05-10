import 'package:community_with_legends_mobile/src/features/feed/domain/models/tag_model.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/repositories/feed_repository.dart';

class GetTagsUseCase {
  final FeedRepository repository;

  GetTagsUseCase(this.repository);

  Future<List<Tag>> execute(String filter) {
    return repository.getTags(filter);
  }
}
