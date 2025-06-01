import 'package:community_with_legends_mobile/database/converters/string_list_converter.dart';
import 'package:drift/drift.dart';

class Users extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get email => text()();
  TextColumn get avatarUrl => text()();
  BoolColumn get isBanned => boolean()();
  BoolColumn get hasPassword => boolean()();
  BoolColumn get hasTwitchAccount => boolean()();
  DateTimeColumn get emailVerifiedAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  TextColumn get permissions => text().map(const StringListConverter())();
}
