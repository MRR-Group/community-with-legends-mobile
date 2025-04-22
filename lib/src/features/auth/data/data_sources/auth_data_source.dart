import 'package:community_with_legends_mobile/src/shared/data/data_sources/http_client.dart';

class AuthDataSource extends HttpClient {
  AuthDataSource({required super.baseUrl});

  Future<Map<String, dynamic>> login(
    String email,
    String password,
  ) async {
    final Map<String, String> body = {
      'email': email,
      'password': password,
    };

    return postRequest(
      urlPath: 'api/auth/login',
      body: body,
    );
  }

  Future<Map<String, dynamic>> register(
    String email,
    String name,
    String password,
  ) async {
    final Map<String, String> body = {
      'email': email,
      'name': name,
      'password': password,
    };

    return postRequest(
      urlPath: 'api/auth/register',
      body: body,
    );
  }

  void sendResetToken(String email) {
    final Map<String, String> body = {
      'email': email,
    };

    postRequest(
      urlPath: 'api/auth/forgot-password',
      body: body,
    );
  }

  void resetPassword({
    required String email,
    required String token,
    required String password,
    required String passwordConfirmation,
  }) {
    final Map<String, String> body = {
      'email': email,
      'token': token,
      'password': password,
      'password_confirmation': passwordConfirmation,
    };

    postRequest(
      urlPath: 'api/auth/reset-password',
      body: body,
    );
  }
}
