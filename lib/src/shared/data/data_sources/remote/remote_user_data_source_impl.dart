import 'package:community_with_legends_mobile/src/core/data/network/http_client.dart';
import 'package:community_with_legends_mobile/src/shared/data/data_sources/remote/remote_user_data_source.dart';

class UserDataSourceImpl extends HttpClient implements UserDataSource{

  UserDataSourceImpl({required super.baseUrl});

  @override
  Future<Map<String, dynamic>> getUserById(int id){
    return getRequest(urlPath: '/api/users/$id');
  }
}
