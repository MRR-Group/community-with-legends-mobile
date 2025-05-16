import 'package:community_with_legends_mobile/src/shared/domain/models/pagination_model.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/post_model.dart';

class FeedPosts {
  final List<Post> posts;
  final Pagination pagination;

  FeedPosts({
    required this.posts,
    required this.pagination,
  });

  factory FeedPosts.fromJson(Map<String, dynamic> json) {
    return FeedPosts(
      posts: (json['data'] as List<dynamic>)
          .map((postJson) => Post.fromJson(postJson))
          .toList(),
      pagination: Pagination.fromJson(json['meta']),
    );
  }
}
