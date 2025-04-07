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

  Future<Map<String, dynamic>> _feedGetRequest({
    required String urlPath,
  }) async {
    final url = Uri.parse('$apiUrl/$urlPath');

    final response = await http.get(
      url,
      headers: headers,
    );

    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> getPosts() async {

    return _feedGetRequest(
      urlPath: 'api/posts',
    );
  }
}
