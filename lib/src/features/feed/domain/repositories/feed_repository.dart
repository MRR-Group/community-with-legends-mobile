import 'package:community_with_legends_mobile/src/features/feed/domain/models/post_model.dart';

abstract class FeedRepository{
  Future<List<Post>> getPosts();
}
