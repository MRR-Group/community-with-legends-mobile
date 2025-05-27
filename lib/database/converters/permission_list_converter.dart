import 'dart:convert';
import 'package:community_with_legends_mobile/src/shared/domain/models/permissions_enum.dart';
import 'package:drift/drift.dart';

class PermissionListConverter extends TypeConverter<List<Permission>, String> {
  const PermissionListConverter();

  @override
  List<Permission> fromSql(String fromDb) {
    final List<dynamic> decoded = jsonDecode(fromDb);

    return decoded
        .map(
          (element) => Permission.values.firstWhere(
            (permission) => permission.name == element,
          ),
        )
        .toList();
  }

  @override
  String toSql(List<Permission> value) {
    return jsonEncode(value.map((permission) => permission.name).toList());
  }
}
