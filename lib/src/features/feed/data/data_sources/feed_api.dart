import 'dart:convert';
import 'package:http/http.dart' as http;

class FeedApi {
  final String apiUrl;

  FeedApi(this.apiUrl);

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  Future<Map<String, dynamic>> _feedPostRequest({
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

  Future<Map<String, dynamic>> getPosts(
      String email,
      String password,
      ) async {
    final Map<String, String> body = {};

    return _feedPostRequest(body: body, urlPath: 'api/posts');
  }
}
