import 'dart:convert';
import 'package:drift/drift.dart';

class StringListConverter extends TypeConverter<List<String>, String> {
  const StringListConverter();

  @override
  List<String> fromSql(String fromDb) {
    final decoded = jsonDecode(fromDb);
    return List<String>.from(decoded);
  }

  @override
  String toSql(List<String> value) {
    return jsonEncode(value);
  }
}
