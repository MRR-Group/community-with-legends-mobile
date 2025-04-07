import 'package:community_with_legends_mobile/src/features/feed/domain/models/feed_link_model.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/models/post_model.dart';

class FeedPosts {
  final int currentPage;
  final List<Post> posts;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final List<FeedLink> links;
  final String? nextPageUrl;
  final String path;
  final int perPage;
  final String? prevPageUrl;
  final int to;
  final int total;

  FeedPosts({
    required this.currentPage,
    required this.posts,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory FeedPosts.fromJson(Map<String, dynamic> json) {
    return FeedPosts(
      currentPage: json['current_page'],
      posts: (json['data'] as List<dynamic>)
          .map((linkJson) => Post.fromJson(json))
          .toList(),
      firstPageUrl: json['first_page_url'],
      from: json['from'],
      lastPage: json['last_page'],
      lastPageUrl: json['last_page_url'],
      links: (json['links'] as List<dynamic>)
          .map((linkJson) => FeedLink.fromJson(json))
          .toList(),
      nextPageUrl: json['next_page_url'],
      path: json['path'],
      perPage: json['per_page'],
      prevPageUrl: json['prev_page_url'],
      to: json['to'],
      total: json['total'],
    );
  }
}
