import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthApi {
  final String apiUrl;

  AuthApi(this.apiUrl);

  Future<Map<String, dynamic>> login(String email, String password) async {



    final url = Uri.parse('$apiUrl/api/auth/login');

    Map<String, String> body = {
      'email': email,
      'password': password,
    };
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body),
    );

    return jsonDecode(response.body);
  }
}
