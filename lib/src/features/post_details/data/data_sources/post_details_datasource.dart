import 'package:community_with_legends_mobile/src/core/data/network/http_client.dart';

class PostDetailsDatasource extends HttpClient{
  PostDetailsDatasource({required super.baseUrl});

  Future<Map<String, dynamic>> getPost(int postId) async {
    return getRequest(
      urlPath: 'api/posts/$postId',
    );
  }
}
