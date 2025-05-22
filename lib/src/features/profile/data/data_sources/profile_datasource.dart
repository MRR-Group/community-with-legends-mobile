import 'package:community_with_legends_mobile/src/core/data/network/http_client.dart';

class ProfileDatasource extends HttpClient{
  ProfileDatasource({required super.baseUrl});
  
  Future<Map<String, dynamic>> getUserProfile(int userId){
    return getRequest(urlPath: 'api/users/$userId');
  }
}
