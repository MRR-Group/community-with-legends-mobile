import 'package:community_with_legends_mobile/src/core/data/network/http_client.dart';

class UserDataSource extends HttpClient{

  UserDataSource({required super.baseUrl});

  Future<Map<String, dynamic>> getUserById(int id){
    return getRequest(urlPath: '/api/users/$id');
  }
}
