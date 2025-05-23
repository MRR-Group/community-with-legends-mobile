import 'package:community_with_legends_mobile/src/core/data/network/http_client.dart';

class SearchUsersDataSource extends HttpClient {
  SearchUsersDataSource({required super.baseUrl});

  Future<Map<String, dynamic>> searchUsersByName(String filter) {
    return getRequest(
      urlPath: '/api/users/search',
      queryParams: {'filter': filter},
    );
  }
}
