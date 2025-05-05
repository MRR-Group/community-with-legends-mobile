import 'package:community_with_legends_mobile/src/features/post_details/domain/repositories/post_details_repository.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/post_model.dart';

class GetPostUsecase {
  final PostDetailsRepository repository;

  GetPostUsecase(this.repository);

  Future<Post> execute(int postId) {
    return repository.getPost(postId);
  }
}
