import 'package:community_with_legends_mobile/src/features/post_details/domain/repositories/post_details_repository.dart';

class CreateCommentUsecase {
  final PostDetailsRepository repository;

  CreateCommentUsecase(this.repository);

  Future<void> execute({
    required int postId,
    required String content,
  }) {
    return repository.createComment(postId, content);
  }
}
