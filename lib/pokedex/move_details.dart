import 'package:flutter/material.dart';
import 'package:flutter_db_test/database/db.dart';
import 'package:flutter_db_test/database/tables/moves.dart';
import 'package:flutter_db_test/sliver_db_viewer.dart';
import 'package:provider/provider.dart';

import 'widgets/pokemon_list_item.dart';
import 'widgets/type_box.dart';

class MoveDetails extends StatelessWidget {
  const MoveDetails(this.move, {this.appBarColor = Colors.blue});

  final Move move;
  final Color appBarColor;

  String? _getTargetDesc() {
    if (move.target == 'allAdjacent') {
      return 'In Doubles, hits all adjacent Pokémon (including allies)';
    } else if (move.target == 'allAdjacentFoes') {
      return 'In Doubles, hits all adjacent foes';
    }
    return null;
  }

  String? _getPriorityDesc() {
    if (move.priority > 1) {
      return 'Nearly always moves first (priority +${move.priority}).';
    } else if (move.priority <= -1) {
      return 'Nearly always moves last (priority ${move.priority}).';
    } else if (move.priority == 1) {
      return 'Usually moves first (priority +${move.priority}).';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<MyDatabase>(context);
    final priority = _getPriorityDesc();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(move.name), backgroundColor: appBarColor),
        body: DbView(
          db: db,
          sortColumns: ['name'],
          query: "SELECT * FROM pokemons INNER JOIN learn_sets on learn_sets.name_id = pokemons.name_id WHERE learn_sets.move_id = '${move.id}'",
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(8),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Type :', style: TextStyle(fontSize: 16)),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const SizedBox(width: 8),
                        TypeBox(move.type),
                        const SizedBox(width: 4),
                        TypeBox(move.category, pressable: false),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const Text('Power:', style: TextStyle(fontSize: 18)),
                            Text(
                              move.basePower > 0 ? '${move.basePower}%' : '-',
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text('Accuracy:', style: TextStyle(fontSize: 18)),
                            Text(
                              move.accuracy != null ? '${move.accuracy}%' : '-',
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text('pp:', style: TextStyle(fontSize: 18)),
                            Row(
                              children: [
                                Text('${move.pp}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                Text('(max: ${move.ppMax})', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    if (priority != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(priority, style: const TextStyle(fontSize: 16)),
                      ),
                    const SizedBox(height: 8),
                    Text(move.desc!, style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 8),
                    Text(
                      'Pokemons with ${move.name}:',
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
