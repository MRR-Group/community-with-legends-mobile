import 'package:community_with_legends_mobile/src/core/data/network/http_client.dart';
import 'package:community_with_legends_mobile/src/shared/data/data_sources/user_data_source.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/user_model.dart';

class UserDataSourceImpl extends HttpClient implements UserDataSource {
  UserDataSourceImpl({required super.baseUrl});

  @override
  Future<User> getUserById(int id) async {
    final response = await getRequest(urlPath: '/api/users/$id');
    final user = User.fromJson(response);

    return user;
  }

  @override
  Future<User> getCurrentUser() async {
    final response = await getRequest(urlPath: 'api/user');
    final user = User.fromJson(response['data']);

    return user;
  }

  Future<Map<String, dynamic>> reportUser(int userId) async {
    return postRequest(urlPath: 'api/users/$userId/report');
  }

  Future<Map<String, dynamic>> banUser(int userId) async {
    return postRequest(urlPath: 'api/users/$userId/ban');
  }
}
