import 'dart:convert';
import 'dart:io' as io;

import 'package:community_with_legends_mobile/src/core/errors/exceptions/http_exception.dart';
import 'package:community_with_legends_mobile/src/core/errors/exceptions/message_exception.dart';
import 'package:community_with_legends_mobile/src/core/errors/exceptions/no_internet_exception.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpClient {
  final Dio _dio;
  final String baseUrl;
  final String rootPem;

  HttpClient({Dio? dio, required this.baseUrl, this.rootPem = ''})
      : _dio = dio ?? Dio(BaseOptions(baseUrl: baseUrl)) {
    _initAdapter();
  }

  void _initAdapter() {
    (_dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = io.HttpClient();
      client.badCertificateCallback =
          (io.X509Certificate cert, String host, int port) {
        //return cert.pem == rootPem;
        return true;
      };
      return client;
    };
  }

  Future<Map<String, dynamic>> postRequest({
    Map<String, dynamic> body = const {},
    required String urlPath,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/$urlPath',
        data: jsonEncode(body),
        options: Options(headers: await _getHeaders()),
      );
      return _handleDioResponse(response);
    } on DioException catch (e) {
      return _handleDioError(e);
    } on io.SocketException {
      throw NoInternetException();
    } catch (e, stackTrace) {
      debugPrint('Error: $e');
      debugPrintStack(stackTrace: stackTrace);
      throw HttpException(message: 'Something went wrong. Try again later');
    }
  }

  Future<Map<String, dynamic>> deleteRequest({
    required String urlPath,
  }) async {
    try {
      final response = await _dio.delete<Map<String, dynamic>>(
        '/$urlPath',
        options: Options(headers: await _getHeaders()),
      );
      return _handleDioResponse(response);
    } on DioException catch (e) {
      return _handleDioError(e);
    } on io.SocketException {
      throw NoInternetException();
    } catch (e, stackTrace) {
      debugPrint('Error: $e');
      debugPrintStack(stackTrace: stackTrace);
      throw HttpException(message: 'Something went wrong. Try again later');
    }
  }

  Future<Map<String, dynamic>> getRequest({
    required String urlPath,
    Map<String, String>? queryParams,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/$urlPath',
        queryParameters: queryParams,
        options: Options(headers: await _getHeaders()),
      );
      return _handleDioResponse(response);
    } on DioException catch (e) {
      return _handleDioError(e);
    } on io.SocketException {
      throw NoInternetException();
    } catch (e, stackTrace) {
      debugPrint('Error: $e');
      debugPrintStack(stackTrace: stackTrace);
      throw HttpException(message: 'Something went wrong. Try again later');
    }
  }

  Future<Map<String, String>> _getHeaders() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token') ?? '';

    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      'X-Client-Platform': 'mobile',
    };
  }

  Map<String, dynamic> _handleDioResponse(Response response) {
    final statusCode = response.statusCode ?? 0;
    final contentType = response.headers.value('content-type') ?? '';

    if (statusCode >= 200 && statusCode < 300) {
      if (contentType.contains('application/json')) {
        try {
          if (response.data is Map<String, dynamic>) {
            return response.data as Map<String, dynamic>;
          } else if (response.data is String) {
            return jsonDecode(response.data as String) as Map<String, dynamic>;
          }
          throw HttpException(message: 'Invalid JSON response.');
        } catch (e) {
          throw HttpException(
            message: 'Error parsing JSON response.',
            statusCode: statusCode,
          );
        }
      } else if (contentType.contains('text') || contentType.contains('html')) {
        return {'message': response.data.toString()};
      } else {
        throw HttpException(
          message: 'Unexpected response format: $contentType',
          statusCode: statusCode,
        );
      }
    } else {
      throw HttpException.fromStatusCode(statusCode: statusCode);
    }
  }

  Never _handleDioError(DioException e) {
    if (e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.unknown) {
      throw MessageException('Something went wrong. Try again later');
    }
    final statusCode = e.response?.statusCode ?? 0;
    throw HttpException(
      message:
          e.response?.statusMessage ?? 'Something went wrong. Try again later',
      statusCode: statusCode,
    );
  }
}
