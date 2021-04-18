import 'dart:convert';
import 'dart:io';
import 'package:json_annotation/json_annotation.dart' as j;
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'db.g.dart';

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
class PokemonAbilities {
  @j.JsonKey(name: '0')
  String first;
  @j.JsonKey(name: '1', includeIfNull: false)
  String? second;
  @j.JsonKey(name: 'H', includeIfNull: false)
  String? hidden;
  @j.JsonKey(name: 'S', includeIfNull: false)
  String? special;

  PokemonAbilities(this.first, this.second, this.hidden, this.special);

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

class Pokemons extends Table {
  @JsonKey('num')
  IntColumn get id => integer().nullable()();

  TextColumn get name => text().nullable()();

  TextColumn get nameId => text().nullable()();

  @JsonKey('heightm')
  RealColumn get height => real().nullable()();

  @JsonKey('weightkg')
  RealColumn get weight => real().nullable()();

  TextColumn get types => text().nullable().map(ListConverter<String>())();

  IntColumn get hp => integer().nullable()();

  IntColumn get atk => integer().nullable()();

  IntColumn get def => integer().nullable()();

  IntColumn get spa => integer().nullable()();

  IntColumn get spd => integer().nullable()();

  IntColumn get spe => integer().nullable()();

  IntColumn get bst => integer().nullable()();

  TextColumn get abilities => text().nullable().map(PokemonAbilitiesConverter())();

  /*TextColumn get prevo => text().nullable()();

  TextColumn get evos => text().nullable().map(ListConverter<String>())();

  IntColumn get evoLevel => integer().nullable()();

  TextColumn get evoType => text().nullable()();

  TextColumn get evoItem => text().nullable()();

  TextColumn get evoMove => text().nullable()();

  TextColumn get evoCondition => text().nullable()();

  /// Pokemon base forme (e.g. Deoxys normal, Landorus Incarnate)
  TextColumn get baseForme => text().nullable()();

  /// Forme name (e.g. Mega-Y, Gmax)
  TextColumn get forme => text().nullable()();

  /// Base pokemon, always here if forme exists
  TextColumn get baseSpecies => text().nullable()();

  /// Alternative formes (e.g. Mega / Primal)
  TextColumn get otherFormes => text().nullable().map(ListConverter<String>())();

  TextColumn get cosmeticFormes => text().nullable().map(ListConverter<String>())();

  TextColumn get formeOrder => text().nullable().map(ListConverter<String>())();

  TextColumn get changesFrom => text().nullable()();

  TextColumn get canGigantamax => text().nullable()();

  /// Required item in order to change form (e.g. Charizardite X)
  TextColumn get requiredItem => text().nullable()();*/

  TextColumn get tier => text().nullable()();

  ///TextColumn get isNonStandard => text().nullable()();

  static List<Pokemon> fromJson(Map<String, dynamic> json) {
    final List<Pokemon> list = [];

    json.forEach((key, dynamic value) {
      if (value != null) {
        int hp = value['baseStats']['hp'] as int;
        int atk = value['baseStats']['atk'] as int;
        int def = value['baseStats']['def'] as int;
        int spa = value['baseStats']['spa'] as int;
        int spd = value['baseStats']['spd'] as int;
        int spe = value['baseStats']['spe'] as int;
        int bst = hp + atk + def + spa + spd + spe;

        list.add(Pokemon(
          id: value['num'] as int,
          name: value['name'] as String,
          nameId: MyDatabase.toId(value['name']),
          height: (value['heightm'] as num).toDouble(),
          weight: (value['weightkg'] as num).toDouble(),
          types: (value['types'] as List).map((e) => e as String).toList(),
          hp: hp,
          atk: atk,
          def: def,
          spa: spa,
          spd: spd,
          spe: spe,
          bst: bst,
          abilities: PokemonAbilities.fromJson(value['abilities']),
          tier: null,///value['tier'] as String,
        ));
      }
    });
    return list;
  }
}

@DataClassName('Ability')
class Abilities extends Table {
  @JsonKey('num')
  IntColumn get id => integer()();

  TextColumn get name => text()();

  TextColumn get shortDesc => text()();

  TextColumn get desc => text()();

  RealColumn get rating => real()();

  static List<Ability> fromJson(Map<String, dynamic> json) {
    final List<Ability> list = [];

    json.forEach((key, dynamic value) {
      if (value != null) {
        list.add(Ability.fromJson(value));
      }
    });
    return list;
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    return VmDatabase(file);
  });
}

@UseMoor(tables: [Pokemons, Abilities])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static String toId(String s) {
    return s.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]+'), '');
  }
}
