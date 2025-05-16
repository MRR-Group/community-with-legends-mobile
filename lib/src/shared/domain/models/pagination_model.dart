import 'package:community_with_legends_mobile/src/features/feed/domain/models/feed_link_model.dart';

class Pagination {
  final int currentPage;
  final int from;
  final int lastPage;
  final List<FeedLink> links;
  final String path;
  final int perPage;
  final int to;
  final int total;

  Pagination({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      currentPage: json['current_page'],
      from: json['from'] ?? 0,
      lastPage: json['last_page'],
      links: (json['links'] as List<dynamic>)
          .map((linkJson) => FeedLink.fromJson(linkJson))
          .toList(),
      path: json['path'],
      perPage: json['per_page'],
      to: json['to'] ?? 0,
      total: json['total'],
    );
  }
}
