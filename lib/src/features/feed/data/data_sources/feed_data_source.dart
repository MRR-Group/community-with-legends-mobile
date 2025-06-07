import 'package:community_with_legends_mobile/src/core/data/network/http_client.dart';

class FeedDataSource extends HttpClient {
  FeedDataSource({required super.baseUrl});

  Future<Map<String, dynamic>> getPosts() async {
    return getRequest(
      urlPath: 'api/posts',
    );
  }

  Future<Map<String, dynamic>> getTrendingPosts() async {
    return getRequest(
      urlPath: 'api/posts/trending',
    );
  }

  Future<Map<String, dynamic>> getFilteredPosts(int? tagId, int? gameId) async {
    return getRequest(
      urlPath: 'api/posts/filter',
      queryParams: {
        if (tagId != null) 'tag': tagId.toString(),
        if (tagId != null) 'game': gameId.toString(),
      },
    );
  }

  Future<Map<String, dynamic>> createPost({
    required String content,
    int? gameId,
    List<int>? tagIds,
    int? assetId,
    String? assetLink,
  }) {
    return postRequest(
      urlPath: 'api/posts',
      body: {
        'content': content,
        'game_id': gameId ?? '',
        'tag_ids': tagIds ?? [],
        'asset_type_id': assetId,
        'asset_link': assetLink,
      },
    );
  }

  Future<Map<String, dynamic>> getFilteredGames(String filter) {
    return getRequest(
      urlPath: 'api/games/search',
      queryParams: {'search': filter},
    );
  }

  Future<Map<String, dynamic>> getTags(String filter) {
    return getRequest(
      urlPath: 'api/tags/search',
      queryParams: {'search': filter},
    );
  }

  Future<void> addPostReaction(int postId) async {
    postRequest(
      urlPath: 'api/posts/$postId/reactions',
    );
  }

  Future<void> removePostReaction(int postId) async {
    deleteRequest(
      urlPath: 'api/posts/$postId/reactions',
    );
  }

  Future<Map<String, dynamic>> reportPost(int postId) async {
    return postRequest(
      urlPath: 'api/posts/$postId/report',
    );
  }

  Future<Map<String, dynamic>> deletePost(int postId) async {
    return deleteRequest(
      urlPath: 'api/posts/$postId',
    );
  }
}
