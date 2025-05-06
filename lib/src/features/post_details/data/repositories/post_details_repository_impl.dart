import 'package:community_with_legends_mobile/src/features/post_details/data/data_sources/post_details_datasource.dart';
import 'package:community_with_legends_mobile/src/features/post_details/domain/repositories/post_details_repository.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/post_model.dart';

class PostDetailsRepositoryImpl implements PostDetailsRepository{
  PostDetailsDatasource api;

  PostDetailsRepositoryImpl(this.api);


  @override
  Future<Post> getPost(int postId) async {
    final response = await api.getPost(postId);

    try {
      final result = Post.fromJson(response);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> createComment(int postId, String content) async {
    api.createComment(postId, content);
  }
}
