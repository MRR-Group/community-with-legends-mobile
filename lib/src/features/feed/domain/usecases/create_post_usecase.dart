import 'package:community_with_legends_mobile/src/features/feed/domain/repositories/feed_repository.dart';

class CreatePostUseCase {
  final FeedRepository feedRepository;

  CreatePostUseCase(this.feedRepository);

  Future<void> execute({
    required String content,
    int? gameId,
    List<int>? tagIds,
    int? assetId,
    String? assetLink,
  }) async {
    await feedRepository.createPost(
      content: content,
      gameId: gameId,
      tagIds: tagIds,
      assetId: assetId,
      assetLink: assetLink,
    );
  }
}
