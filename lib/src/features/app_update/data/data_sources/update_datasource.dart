import 'dart:convert';

import 'package:community_with_legends_mobile/src/core/errors/exceptions/check_update_exception.dart';
import 'package:community_with_legends_mobile/src/features/app_update/domain/models/version_response_model.dart';
import 'package:http/http.dart' as http;

class UpdateDatasource {
  final String _apiUrl;

  UpdateDatasource(this._apiUrl);

  Future<VersionResponse> getLatestVersion() async {
    final url = Uri.parse(_apiUrl);
    final response = await http.get(url);

    if(response.statusCode != 200){
      throw CheckUpdateException();
    }

    return VersionResponse.fromJson(jsonDecode(response.body));
  }
}
