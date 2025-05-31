import 'package:community_with_legends_mobile/src/core/data/network/http_client.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileDatasource extends HttpClient {
  ProfileDatasource({required super.baseUrl});

  Future<Map<String, dynamic>> getUserProfile(int userId) {
    return getRequest(urlPath: 'api/users/$userId');
  }

  Future<Map<String, dynamic>> getCurrentUserProfile() {
    return getRequest(urlPath: 'api/user');
  }

  Future<Map<String, dynamic>> changeUserNickname(String nickname) {
    return postRequest(
      urlPath: 'api/user/name',
      body: {
        'name': nickname,
      },
    );
  }

  Future<Map<String, dynamic>> deleteUserAvatar() async {
    return deleteRequest(
      urlPath: 'api/user/avatar',
    );
  }

  Future<bool> changeUserAvatar(XFile avatar) async {
    return _updateAvatarRequest(
      urlPath: 'api/user/avatar',
      filePath: avatar.path,
    );
  }

  Future<bool> _updateAvatarRequest({
    required String urlPath,
    required String filePath,
  }) async {
    final url = Uri.parse('$baseUrl/$urlPath');
    final request = http.MultipartRequest('post', url);
    final file = await http.MultipartFile.fromPath('avatar', filePath);

    request.files.add(file);

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token') ?? '';

    request.headers['Authorization'] = 'Bearer $token';

    final response = await request.send();

    return response.statusCode == 200;
  }
}
