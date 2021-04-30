import 'dart:convert';
import 'package:json_annotation/json_annotation.dart' as j;
import 'package:moor/moor.dart';

part 'pokemons.g.dart';

class Pokemons extends Table {
  IntColumn get id => integer()();

  TextColumn get name => text()();

  TextColumn get nameId => text()();

  IntColumn get hp => integer()();

  IntColumn get atk => integer()();

  IntColumn get def => integer()();

  IntColumn get spa => integer()();

  IntColumn get spd => integer()();

  IntColumn get spe => integer()();

  IntColumn get bst => integer()();

  RealColumn get height => real()();

  RealColumn get weight => real()();

  TextColumn get types => text().map(ListConverter<String>())();

  TextColumn get abilities => text().map(PokemonAbilitiesConverter())();

  TextColumn get evolution => text().map(PokemonEvolutionsConverter())();

  TextColumn get formes => text().map(PokemonFormesConverter())();

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

  List<String?> get toList => [first, second, hidden, special];

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

@j.JsonSerializable()
class PokemonFormes {
  @j.JsonKey(includeIfNull: false)
  final String? baseForme;

  /// Forme name (e.g. Mega-Y, Gmax)
  @j.JsonKey(includeIfNull: false)
  final String? forme;

  /// Base pokemon, always here if forme exists
  @j.JsonKey(includeIfNull: false)
  final String? baseSpecies;

  /// Alternative formes (e.g. Mega / Primal)
  @j.JsonKey(includeIfNull: false)
  final List<String>? otherFormes;

  //List<String> cosmeticFormes;

  @j.JsonKey(includeIfNull: false)
  final List<String>? formeOrder;

  @j.JsonKey(includeIfNull: false)
  final String? canGigantamax;

  /// Gigantamax only: base pokemon
  @j.JsonKey(includeIfNull: false)
  final String? changesFrom;

  /// Required item to change into current form
  @j.JsonKey(includeIfNull: false)
  final String? requiredItem;

  PokemonFormes(
    this.baseForme,
    this.forme,
    this.baseSpecies,
    this.otherFormes,
    this.formeOrder,
    this.canGigantamax,
    this.changesFrom,
    this.requiredItem,
  );

  factory PokemonFormes.fromJson(Map<String, dynamic> json) => _$PokemonFormesFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonFormesToJson(this);
}

class PokemonFormesConverter extends TypeConverter<PokemonFormes, String> {
  const PokemonFormesConverter();

  @override
  PokemonFormes? mapToDart(String? fromDb) {
    if (fromDb == null) {
      return null;
    }
    return PokemonFormes.fromJson(json.decode(fromDb));
  }

  @override
  String? mapToSql(PokemonFormes? value) {
    if (value == null) {
      return null;
    }
    return json.encode(value.toJson());
  }
}
