import 'package:drift/drift.dart';

class HardwareTable extends Table{
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer()();
  TextColumn get title => text()();
  TextColumn get value => text()();
}
