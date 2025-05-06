import 'package:community_with_legends_mobile/src/core/data/network/http_client.dart';
import 'package:flutter/cupertino.dart';

class PostDetailsDatasource extends HttpClient {
  PostDetailsDatasource({required super.baseUrl});

  Future<Map<String, dynamic>> getPost(int postId) async {
    return getRequest(
      urlPath: 'api/posts/$postId',
    );
  }

  void createComment(int postId, String content) {
    debugPrint(
      postRequest(
        urlPath: 'api/posts/$postId/comments',
        body: {
          'content': content,
        },
      ).toString(),
    );
  }
}
