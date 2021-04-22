import 'package:moor/moor.dart';

class Stats extends Table {
  TextColumn get nameId => text()();

  IntColumn get hp => integer()();

  IntColumn get atk => integer()();

  IntColumn get def => integer()();

  IntColumn get spa => integer()();

  IntColumn get spd => integer()();

  IntColumn get spe => integer()();

  IntColumn get bst => integer()();
}