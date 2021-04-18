import 'dart:convert';

import 'widgets/stats_box.dart';
import 'widgets/pokemon_icon.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_db_test/db_viewer.dart';
import 'package:provider/provider.dart';
import 'database/db.dart';

void fillDataBaseFromJson(MyDatabase db) async {
  final dexJson = await rootBundle.loadString('assets/pokedex.json');
  final abilitiesJson = await rootBundle.loadString('assets/abilities.json');

  await db.delete(db.pokemons).go();
  await db.delete(db.abilities).go();

  await db.batch((batch) => batch.insertAll(
      db.abilities, Abilities.fromJson(jsonDecode(abilitiesJson))));
  await db.batch((batch) =>
      batch.insertAll(db.pokemons, Pokemons.fromJson(jsonDecode(dexJson))));
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final database = MyDatabase();
  //fillDataBaseFromJson(database);

  runApp(
    MultiProvider(
      providers: [
        Provider<MyDatabase>(
          create: (_) => database,
          dispose: (_, db) => db.close(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final db = Provider.of<MyDatabase>(context);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SafeArea(
        child: Scaffold(
          body: DbViewer(
            database: db,
            query: "SELECT id, types, name, abilities, hp, atk, def, spa, spd, spe, bst FROM pokemons",
            rows: (int index, Row content) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: content,
                ),
                color: index % 2 == 0 ? Colors.pink[100] : Colors.white,
              );
            },
            columns: [
              DbColumn(
                name: 'id',
                sort: false,
                cell: (Map<String, dynamic> data) {
                  final pokemon = Pokemon.fromData(data, db);

                  return Container(
                    width: 68,
                    child: Column(
                      children: [
                        Padding(
                          key: UniqueKey(),
                          child: PokemonIcon(pokemon.id!),
                          padding: const EdgeInsets.symmetric(vertical: 2),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...pokemon.types!.map(
                              (t) => Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 1),
                                child: Image.asset('assets/types/$t.png'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),

              DbColumn(
                name: 'name',
                cell: (Map<String, dynamic> data) {
                  final pokemon = Pokemon.fromData(data, db);

                  return Expanded(
                    child: Column(
                      children: [
                        Text(pokemon.name!),
                        ...pokemon.abilities!.toList().map((a) => Text(a, style: const TextStyle(fontSize: 10)))
                      ],
                    ),
                  );
                },
              ),

              DbColumn(
                name: 'hp',
                cell: (Map<String, dynamic> data) {
                  final pokemon = Pokemon.fromData(data, db);

                  return StatsBox(pokemon);
                },
              ),
              DbColumn(name: 'atk'),
              DbColumn(name: 'def'),
              DbColumn(name: 'spa'),
              DbColumn(name: 'spd'),
              DbColumn(name: 'spe'),
              DbColumn(name: 'bst'),

              DbColumn(
                name: 'types',
                filter: true,
              ),
              DbColumn(
                name: 'abilities',
                filter: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
