import 'dart:convert';
import 'package:community_with_legends_mobile/src/core/errors/exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FeedApi {
  final String apiUrl;

  FeedApi(this.apiUrl);

  Future<Map<String, String>> _getHeaders() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');

    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Map<String, dynamic>> _feedPostRequest({
    required Map<String, String> body,
    required String urlPath,
  }) async {
    final url = Uri.parse('$apiUrl/$urlPath');

    final response = await http.post(
      url,
      headers: await _getHeaders(),
      body: jsonEncode(body),
    );

    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> _feedGetRequest({
    required String urlPath,
  }) async {
    final url = Uri.parse('$apiUrl/$urlPath');

    final response = await http.get(
      url,
      headers: await _getHeaders(),
    );

    if (response.statusCode == 401) {
      throw AuthException('Unauthenticated');
    } else if (response.statusCode != 200) {
      throw AuthException('Something went wrong');
    }

    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> getPosts() async {
    return _feedGetRequest(
      urlPath: 'api/posts',
    );
  }
}
