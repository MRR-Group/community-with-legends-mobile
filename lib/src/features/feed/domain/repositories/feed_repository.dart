import 'package:community_with_legends_mobile/src/features/feed/domain/models/feed_posts_model.dart';

abstract class FeedRepository{
  Future<FeedPosts> getPosts();
}
