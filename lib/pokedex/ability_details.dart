import 'package:flutter/material.dart';
import 'package:flutter_db_test/database/db.dart';
import 'package:flutter_db_test/sliver_db_viewer.dart';
import 'package:provider/provider.dart';

import 'widgets/pokemon_list_item.dart';

class AbilityDetails extends StatelessWidget {
  const AbilityDetails(this.ability, {this.appBarColor = Colors.blue});

  final Ability ability;
  final Color appBarColor;

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<MyDatabase>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(ability.name),
          backgroundColor: appBarColor,
        ),
        body: DbView(
          db: db,
          sortColumns: ['name'],
          query: "select * from pokemons where abilities like '%${ability.name}%'",
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(8),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(ability.desc, style: const TextStyle(fontSize: 16)),
                    ),
                    Text(
                      'Pokemons with ${ability.name}:',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
          rowRenderer: (BuildContext context, int index, Map<String, dynamic> data) {
            return PokemonListItem(Pokemon.fromData(data, db), index);
          },
        ),
      ),
    );
  }
}