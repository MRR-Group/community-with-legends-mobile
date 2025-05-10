import 'dart:convert';

import 'package:community_with_legends_mobile/src/core/errors/exceptions/http_exception.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HttpClient {
  final http.Client _httpClient;
  final String baseUrl;

  HttpClient({http.Client? client, required this.baseUrl})
      : _httpClient = client ?? http.Client();

  Future<Map<String, dynamic>> postRequest({
    Map<String, dynamic> body = const {},
    required String urlPath,
  }) async {
    final url = Uri.parse('$baseUrl/$urlPath');

    return _handleRequest(
      _httpClient.post(
        url,
        headers: await _getHeaders(),
        body: jsonEncode(body),
      ),
    );
  }

  Future<Map<String, dynamic>> deleteRequest({
    required String urlPath,
  }) async {
    final url = Uri.parse('$baseUrl/$urlPath');

    return _handleRequest(
      _httpClient.delete(
        url,
        headers: await _getHeaders(),
      ),
    );
  }

  Future<Map<String, dynamic>> getRequest({
    required String urlPath,
    Map<String, String>? queryParams,
  }) async {
    final url = Uri.parse(baseUrl).replace(
      path: urlPath,
      queryParameters: queryParams,
    );

    return _handleRequest(
      _httpClient.get(
        url,
        headers: await _getHeaders(),
      ),
    );
  }

  Future<Map<String, String>> _getHeaders() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token') ?? '';

    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Map<String, dynamic>> _handleRequest(
    Future<http.Response> request,
  ) async {
    try {
      final response = await request;

      return _handleHttpResponse(response);
    } catch (e, stackTrace) {
      debugPrint('Error: $e');
      debugPrintStack(stackTrace: stackTrace);

      throw HttpException(message: 'Something went wrong. Try again later');
    }
  }

  Future<Map<String, dynamic>> _handleHttpResponse(
    http.Response response,
  ) async {
    final statusCode = response.statusCode;
    if (statusCode >= 200 && statusCode < 300) {
        return _handleSuccessResponse(response);
    }else{
      throw HttpException.fromStatusCode(statusCode: statusCode);
    }
  }

  Future<Map<String, dynamic>> _handleSuccessResponse(
    http.Response response,
  ) async {
    final String contentType = response.headers['content-type'] ?? '';

    if (contentType.contains('application/json')) {
      try {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } catch (e) {
        throw HttpException(
          message: 'Error parsing JSON response.',
          statusCode: response.statusCode,
        );
      }
    } else if (contentType.contains('text') || contentType.contains('html')) {
      return {'message': response.body};
    } else {
      throw HttpException(
        message: 'Unexpected response format: $contentType',
        statusCode: response.statusCode,
      );
    }
  }
}
