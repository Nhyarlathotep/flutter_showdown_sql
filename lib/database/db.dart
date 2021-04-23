import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'tables/abilities.dart';
import 'tables/learnsets.dart';
import 'tables/moves.dart';
import 'tables/pokemons.dart';
import 'tables/stats.dart';

part 'db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    return VmDatabase(file, logStatements: true);
  });
}

@UseMoor(tables: [Pokemons, Stats, Abilities, LearnSets, Moves])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static String toId(String s) {
    return s.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]+'), '');
  }

  void fillDataBaseFromJson() async {
    final dexJson = await rootBundle.loadString('assets/pokedex.json');
    final abilitiesJson = await rootBundle.loadString('assets/abilities.json');
    final learnSetJson = await rootBundle.loadString('assets/learnset.json');
    final movesJson = await rootBundle.loadString('assets/moves.json');

    await delete(pokemons).go();
    await delete(abilities).go();
    await delete(stats).go();
    await delete(learnSets).go();
    await delete(moves).go();

    await batch((batch) => batch.insertAll(pokemons, _pokemonsFromJson(jsonDecode(dexJson))));
    await batch((batch) => batch.insertAll(abilities, _abilitiesFromJson(jsonDecode(abilitiesJson))));
    await batch((batch) => batch.insertAll(stats, _statsFromJson(jsonDecode(dexJson))));
    await batch((batch) => batch.insertAll(learnSets, _learnsetsFromJson(jsonDecode(learnSetJson))));
    await batch((batch) => batch.insertAll(moves, _movesFromJson(jsonDecode(movesJson))));
  }

  List<Ability> _abilitiesFromJson(Map<String, dynamic> json) {
    final List<Ability> list = [];

    json.forEach((key, dynamic value) {
      if (value != null) {
        list.add(Ability.fromJson(value));
      }
    });
    return list;
  }

  List<LearnSet> _learnsetsFromJson(Map<String, dynamic> json) {
    final List<LearnSet> list = [];

    json.forEach((key, dynamic value) {
      if (value != null) {
        if (value['learnset'] != null)
          list.addAll((value['learnset'] as Map<String, dynamic>).keys.map((e) => LearnSet(nameId: key, moveId: e)).toList());
      }
    });
    return list;
  }

  List<Move> _movesFromJson(Map<String, dynamic> json) {
    final List<Move> list = [];

    json.forEach((key, dynamic value) {
      if (value != null) {
        list.add(
          Move(
            id: key,
            name: value['name'],
            type: value['type'],
            category: value['category'],
            accuracy: value['accuracy'] is bool ? null : value['accuracy'],
            basePower: value['basePower'],
            pp: value['pp'],
            priority: value['priority'],
            target: value['target'],
            shortDesc: value['shortDesc'],
            desc: value['desc'],
          ),
        );
      }
    });
    return list;
  }

  List<Pokemon> _pokemonsFromJson(Map<String, dynamic> json) {
    final List<Pokemon> list = [];

    json.forEach((key, dynamic value) {
      if (value != null) {
        list.add(Pokemon(
          id: value['num'],
          name: value['name'],
          nameId: toId(value['name']),
          height: (value['heightm'] as num).toDouble(),
          weight: (value['weightkg'] as num).toDouble(),
          types: (value['types'] as List).map((e) => e as String).toList(),
          abilities: PokemonAbilities.fromJson(value['abilities']),
          evolution: PokemonEvolutions.fromJson(value),
          tier: value['tier'] ?? 'Illegal',
        ));
      }
    });
    return list;
  }

  List<Stat> _statsFromJson(Map<String, dynamic> json) {
    final List<Stat> list = [];

    json.forEach((key, dynamic value) {
      if (value != null) {
        int hp = value['baseStats']['hp'] as int;
        int atk = value['baseStats']['atk'] as int;
        int def = value['baseStats']['def'] as int;
        int spa = value['baseStats']['spa'] as int;
        int spd = value['baseStats']['spd'] as int;
        int spe = value['baseStats']['spe'] as int;
        int bst = hp + atk + def + spa + spd + spe;

        list.add(Stat(
          nameId: toId(value['name']),
          hp: hp,
          atk: atk,
          def: def,
          spa: spa,
          spd: spd,
          spe: spe,
          bst: bst,
        ));
      }
    });
    return list;
  }
}