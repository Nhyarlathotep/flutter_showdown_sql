import 'dart:convert';
import 'package:json_annotation/json_annotation.dart' as j;
import 'package:moor/moor.dart';

part 'pokemons.g.dart';

class Pokemons extends Table {
  IntColumn get id => integer()();

  TextColumn get name => text()();

  TextColumn get nameId => text()();

  RealColumn get height => real()();

  RealColumn get weight => real()();

  TextColumn get types => text().map(ListConverter<String>())();

  TextColumn get abilities => text().map(PokemonAbilitiesConverter())();

  TextColumn get evolution => text().map(PokemonEvolutionsConverter())();


  /*TextColumn get prevo => text().nullable()();

  TextColumn get evos => text().nullable().map(ListConverter<String>())();


  TextColumn get evoType => text().nullable()();

  TextColumn get evoCondition => text().nullable()();

  IntColumn get evoLevel => integer().nullable()();

  TextColumn get evoItem => text().nullable()();

  TextColumn get evoMove => text().nullable()();*/


  TextColumn get tier => text()();
}

class ListConverter<T> extends TypeConverter<List<T>, String> {
  @override
  List<T>? mapToDart(String? fromDb) {
    if (fromDb == null) {
      return null;
    }
    final json = jsonDecode(fromDb) as List<dynamic>;
    return json.map((e) => e as T).toList();
  }

  @override
  String? mapToSql(List<T>? value) {
    if (value == null) {
      return null;
    }
    return jsonEncode(value);
  }
}

@j.JsonSerializable()
class PokemonEvolutions {
  @j.JsonKey(includeIfNull: false)
  final String? prevo;

  @j.JsonKey(includeIfNull: false)
  final List<String>? evos;

  @j.JsonKey(includeIfNull: false)
  final String? evoType;

  @j.JsonKey(includeIfNull: false)
  final String? evoCondition;

  @j.JsonKey(includeIfNull: false)
  final int? evoLevel;

  @j.JsonKey(includeIfNull: false)
  final String? evoItem;

  @j.JsonKey(includeIfNull: false)
  final String? evoMove;

  const PokemonEvolutions(
    this.prevo,
    this.evos,
    this.evoType,
    this.evoCondition,
    this.evoLevel,
    this.evoItem,
    this.evoMove,
  );

  factory PokemonEvolutions.fromJson(Map<String, dynamic> json) => _$PokemonEvolutionsFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonEvolutionsToJson(this);
}

class PokemonEvolutionsConverter extends TypeConverter<PokemonEvolutions, String> {
  const PokemonEvolutionsConverter();

  @override
  PokemonEvolutions? mapToDart(String? fromDb) {
    if (fromDb == null) {
      return null;
    }
    return PokemonEvolutions.fromJson(json.decode(fromDb));
  }

  @override
  String? mapToSql(PokemonEvolutions? value) {
    if (value == null) {
      return null;
    }
    return json.encode(value.toJson());
  }
}

@j.JsonSerializable()
class PokemonAbilities {
  @j.JsonKey(name: '0')
  final String first;
  @j.JsonKey(name: '1', includeIfNull: false)
  final String? second;
  @j.JsonKey(name: 'H', includeIfNull: false)
  final String? hidden;
  @j.JsonKey(name: 'S', includeIfNull: false)
  final String? special;

  const PokemonAbilities(this.first, this.second, this.hidden, this.special);

  List<String> toList() {
    return [
      first,
      if (second != null) second!,
      if (hidden != null) hidden!,
      if (special != null) special!,
    ];
  }

  factory PokemonAbilities.fromJson(Map<String, dynamic> json) => _$PokemonAbilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonAbilitiesToJson(this);
}

class PokemonAbilitiesConverter extends TypeConverter<PokemonAbilities, String> {
  const PokemonAbilitiesConverter();

  @override
  PokemonAbilities? mapToDart(String? fromDb) {
    if (fromDb == null) {
      return null;
    }
    return PokemonAbilities.fromJson(json.decode(fromDb));
  }

  @override
  String? mapToSql(PokemonAbilities? value) {
    if (value == null) {
      return null;
    }
    return json.encode(value.toJson());
  }
}