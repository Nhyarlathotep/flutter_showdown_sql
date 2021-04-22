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