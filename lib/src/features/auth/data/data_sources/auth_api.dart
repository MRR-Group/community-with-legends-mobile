import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthApi {
  final String apiUrl;

  AuthApi(this.apiUrl);

  Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse('$apiUrl/api/auth/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    return jsonDecode(response.body);
  }
}
