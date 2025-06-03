import 'dart:convert';
import 'dart:io';

import 'package:community_with_legends_mobile/src/core/errors/exceptions/check_update_exception.dart';
import 'package:community_with_legends_mobile/src/core/errors/exceptions/http_exception.dart';
import 'package:community_with_legends_mobile/src/core/errors/exceptions/no_internet_exception.dart';
import 'package:community_with_legends_mobile/src/features/app_update/domain/models/version_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class UpdateDatasource {
  final String _apiUrl;

  UpdateDatasource(this._apiUrl);

  Future<VersionResponse> getLatestVersion() async {
    final url = Uri.parse(_apiUrl);
    try {
      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw CheckUpdateException();
      }

      return VersionResponse.fromJson(jsonDecode(response.body));
    } on SocketException {
      throw NoInternetException();
    } catch (e, stackTrace) {
      debugPrint('Error: $e');
      debugPrintStack(stackTrace: stackTrace);

      throw HttpException(message: 'Something went wrong. Try again later');
    }
  }
}
