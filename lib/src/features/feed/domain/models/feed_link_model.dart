class FeedLink {
  final String? url;
  final String label;
  final bool active;

  FeedLink({
    required this.url,
    required this.label,
    required this.active,
  });

  factory FeedLink.fromJson(Map<String, dynamic> json) {
    return FeedLink(
      url: json['url'],
      label: json['label'],
      active: json['active'],
    );
  }
}
