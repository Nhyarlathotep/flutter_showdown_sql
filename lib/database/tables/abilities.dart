import 'package:moor/moor.dart';

@DataClassName('Ability')
class Abilities extends Table {
  TextColumn get name => text()();

  TextColumn get shortDesc => text()();

  TextColumn get desc => text()();

  RealColumn get rating => real()();
}