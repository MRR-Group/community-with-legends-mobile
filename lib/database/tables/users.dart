import 'package:community_with_legends_mobile/database/converters/PermissionListConverter.dart';
import 'package:drift/drift.dart';

class Users extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get email => text()();
  DateTimeColumn get emailVerifiedAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  TextColumn get permissions => text().map(const PermissionListConverter())();
}
