import 'package:flutter/material.dart';
import 'package:flutter_db_test/sliver_db_viewer.dart';
import 'package:provider/provider.dart';

import 'database/db.dart';
import 'widgets/stats_box.dart';
import 'widgets/pokemon_icon.dart';
import 'pokedex/pokemon_details.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final database = MyDatabase();

  /*database.fillDataBaseFromJson();
  return;*/

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
          body: CustomScrollView(
            slivers: [
              SliverDbViewer(
                db: db,
                query: "SELECT * FROM pokemons INNER JOIN stats on stats.name_id = pokemons.name_id",
                sortColumns: [
                  'name',
                  'hp',
                  'atk',
                  'def',
                  'spa',
                  'spd',
                  'spe',
                  'bst',
                ],
                filterColumns: ['types', 'abilities'],
                rowRenderer: (context, index, data) {
                  final stats = Stat.fromData(data, db);
                  final pokemon = Pokemon.fromData(data, db);

                  return Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PokemonDetails(pokemon, stats),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: [
                            Container(
                              width: 68,
                              child: Column(
                                children: [
                                  Padding(
                                    key: UniqueKey(),
                                    child: PokemonIcon(pokemon.id),
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 2),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ...pokemon.types.map(
                                        (t) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 1),
                                          child: Image.asset(
                                              'assets/types/$t.png'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(pokemon.name),
                                  ...pokemon.abilities.toList().map(
                                        (a) => Text(
                                          a,
                                          style: const TextStyle(fontSize: 10),
                                        ),
                                      )
                                ],
                              ),
                            ),
                            StatsBox(stats)
                          ],
                        ),
                      ),
                    ),
                    color: index % 2 == 0 ? Colors.pink[100] : Colors.white,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}