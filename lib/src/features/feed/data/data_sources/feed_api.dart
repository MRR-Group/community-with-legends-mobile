import 'dart:convert';
import 'package:community_with_legends_mobile/src/core/errors/exceptions.dart';
import 'package:http/http.dart' as http;

class FeedApi {
  final String apiUrl;

  FeedApi(this.apiUrl);

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer 10|4qvNhHyjUxf35LdKbmrGf3I1fbo7hY9dczVu4wlFd7470e88',
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
    if(response.statusCode == 401){
      throw AuthException('Unauthenticated');
    }else if(response.statusCode != 200){
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
