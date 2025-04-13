import 'dart:convert';
import 'package:community_with_legends_mobile/src/core/errors/exceptions.dart';
import 'package:community_with_legends_mobile/src/core/errors/exceptions/unauthenticated_exception.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FeedApi {
  final String apiUrl;

  FeedApi(this.apiUrl);

  Future<Map<String, String>> _getHeaders() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');

    if (token == null) {
      throw UnauthenticatedException();
    }

    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Map<String, dynamic>> _feedPostRequest({
    required Map<String, dynamic> body,
    required String urlPath,
  }) async {
    final url = Uri.parse('$apiUrl/$urlPath');

    final response = await http.post(
      url,
      headers: await _getHeaders(),
      body: jsonEncode(body),
    );

    if (response.statusCode == 401) {
      throw UnauthenticatedException();
    } else if (response.statusCode != 201) {
      throw AuthException('Something went wrong');
    }

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
      throw UnauthenticatedException();
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

  Future<Map<String, dynamic>> createPost({
    required String content,
    int? gameId,
    List<int>? tagIds,
  }) {
    return _feedPostRequest(
      urlPath: 'api/posts',
      body: {
        'content': content,
        'game_id': gameId ?? '',
        'tagIds': tagIds ?? [],
      },
    );
  }
}
