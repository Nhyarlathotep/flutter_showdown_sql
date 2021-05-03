import 'package:moor/moor.dart';

import '../db.dart';

class Moves extends Table {
  TextColumn get id => text()();

  TextColumn get name => text()();

  TextColumn get type => text()();

  TextColumn get category => text()();

  IntColumn get accuracy => integer().nullable()();

  IntColumn get basePower => integer().named('power')();

  IntColumn get pp => integer()();

  IntColumn get priority => integer()();

  TextColumn get target => text()();

  TextColumn get shortDesc => text().nullable()();

  TextColumn get desc => text().nullable()();
}

extension MoveExtension on Move {
  int get ppMax => pp * 8 ~/ 5;
}