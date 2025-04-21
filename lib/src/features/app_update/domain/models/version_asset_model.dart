class VersionAsset {
  final String name;
  final String downloadUrl;

  VersionAsset({
    required this.name,
    required this.downloadUrl,
  });

  factory VersionAsset.fromJson(Map<String, dynamic> json) {
    return VersionAsset(
      name: json['name'],
      downloadUrl: json['browser_download_url'],
    );
  }
}
