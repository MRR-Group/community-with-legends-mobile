import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthApi {
  final String apiUrl;

  AuthApi(this.apiUrl);

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  Future<Map<String, dynamic>> _authPostRequest({
    required Map<String, String> body,
    required String urlPath,
  }) async {
    final url = Uri.parse('$apiUrl/$urlPath');

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body),
    );

    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> login(
    String email,
    String password,
  ) async {
    final Map<String, String> body = {
      'email': email,
      'password': password,
    };

    return _authPostRequest(body: body, urlPath: 'api/auth/login');
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

    return _authPostRequest(body: body, urlPath: 'api/auth/register');
  }

  void sendResetToken(String email) {
    final Map<String, String> body = {
      'email': email,
    };

    _authPostRequest(body: body, urlPath: 'api/auth/forgot-password');
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

    _authPostRequest(body: body, urlPath: 'api/auth/forgot-password');}
}
