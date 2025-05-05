import 'package:community_with_legends_mobile/src/shared/domain/models/post_model.dart';

abstract class PostDetailsRepository {
  Future<Post> getPost(int postId);
}
