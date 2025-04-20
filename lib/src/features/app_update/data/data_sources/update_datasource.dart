import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class UpdateDatasource {
  final String _apiUrl;

  UpdateDatasource(this._apiUrl);

  Future<void> getLatestVersion() async {
    final url = Uri.parse(_apiUrl);
    final response = await http.get(url);
  }
}
