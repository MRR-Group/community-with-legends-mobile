import 'package:community_with_legends_mobile/src/core/data/network/http_client.dart';
import 'package:community_with_legends_mobile/src/shared/data/data_sources/remote/remote_search_users_data_source.dart';

class SearchUsersDataSourceImpl extends HttpClient implements SearchUsersDataSource {
  SearchUsersDataSourceImpl({required super.baseUrl});

  @override
  Future<Map<String, dynamic>> searchUsersByName(String filter) {
    return getRequest(
      urlPath: '/api/users/search',
      queryParams: {'filter': filter},
    );
  }
}
