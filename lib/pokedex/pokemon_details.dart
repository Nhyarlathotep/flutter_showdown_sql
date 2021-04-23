import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_db_test/database/db.dart';
import 'package:flutter_db_test/database/tables/pokemons.dart';
import 'package:flutter_db_test/sliver_db_viewer.dart';
import 'package:flutter_db_test/widgets/custom_slivers.dart';
import 'package:flutter_db_test/widgets/stats_box.dart';
import 'package:provider/provider.dart';

import '../widgets/pokemon_icon.dart';
import 'widgets/type_box.dart';

class PokemonDetails extends StatelessWidget {
  final Pokemon pokemon;
  final Stat stats;

  PokemonDetails(this.pokemon, this.stats);

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<MyDatabase>(context);

    const String ServerHost = 'play.pokemonshowdown.com';
    const String ServerUrl = 'https://$ServerHost';

    final resourceId = pokemon.nameId;
    //final resourceId = pokemon.forme != null ? '${Parser.toId(pokemon.baseSpecies)}${forme.isEmpty ? '' : '-'}${Parser.toId(forme)}' : pokeId;

    final abilities = [
      pokemon.abilities.first,
      pokemon.abilities.second,
      pokemon.abilities.hidden,
      pokemon.abilities.special,
    ];

    Future<Widget> _getNextEvo(Pokemon current) async {
      return Row(
        children: [
          PokeBox(current, current: current.name == pokemon.name),
          if (current.evolution.evos != null)
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Transform.translate(
                offset: Offset(0, 4),
                child: Icon(Icons.arrow_right_alt),
              ),
            ),
          if (current.evolution.evos != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final nexEvo in current.evolution.evos!)
                  await _getNextEvo(await (db.select(db.pokemons)..where((tbl) => tbl.name.equals(nexEvo))).getSingle()),
              ],
            )
        ],
      );
    }

    Future<Widget> _evoTree() async {
      Pokemon current = pokemon;

      if (current.evolution.prevo == null && current.evolution.evos == null) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Text('Does not evolve', style: TextStyle(fontStyle: FontStyle.italic)),
        );
      }
      while (current.evolution.prevo != null) {
        current = await (db.select(db.pokemons)..where((tbl) => tbl.name.equals(current.evolution.prevo))).getSingle();

        debugPrint(current.name);
      }
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: await _getNextEvo(current),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(pokemon.name),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: <Color>[
                  TypeBox.typeColors[pokemon.types[0]]![0],
                  TypeBox.typeColors[pokemon.types[0]]![0],
                  TypeBox.typeColors[pokemon.types[pokemon.types.length > 1 ? 1 : 0]]![0]
                ],
              ),
            ),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 116,
                          height: 116,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                TypeBox.typeColors[pokemon.types[0]]![0],
                                TypeBox.typeColors[pokemon.types[pokemon.types.length > 1 ? 1 : 0]]![0]
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(2.5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: CachedNetworkImage(
                              fadeOutDuration: kThemeChangeDuration,
                              fadeInDuration: kThemeChangeDuration,
                              imageUrl: '$ServerUrl/sprites/gen5/$resourceId.png',
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, dynamic error) => const Icon(Icons.error),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '#${pokemon.id > 0 ? pokemon.id : '?'}',
                                      style: TextStyle(color: Colors.grey[600]),
                                    ),
                                    GestureDetector(
                                      child: Container(
                                        child: Text(pokemon.tier),
                                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.grey[700]!),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Types :'),
                                  Row(
                                    children: pokemon.types
                                        .map(
                                          (t) => Padding(
                                            padding: const EdgeInsets.only(left: 8),
                                            child: TypeBox(t, pressable: false),
                                          ),
                                        )
                                        .toList(),
                                  )
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Size :'),
                                  Text('${pokemon.height} m, ${pokemon.weight} kg'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text('Abilities :', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (int i = 0; i < abilities.length; i++)
                            if (abilities[i] != null)
                              Row(
                                children: [
                                  if (i != 0)
                                    const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 8),
                                      child: Text('|'),
                                    ),
                                  GestureDetector(
                                    onTap: () {
                                      /*Navigator.push(
                                          context,
                                          MaterialPageRoute<void>(
                                            builder: (context) => AbilityDetails(
                                              abilities[i],
                                              appBarColor: TypeBox.typeColors[pokemon.types[0]][0],
                                            ),
                                          ),
                                        );*/
                                    },
                                    child: Text(
                                      '${abilities[i]}${i == 2 ? ' (H)' : i == 3 ? ' (S)' : ''}',
                                      style: TextStyle(
                                        fontSize: 15,
                                        decoration: TextDecoration.underline,
                                        color: Colors.blue[800],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPinnedHeader(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                /// Trick to remove the 1px gap
                decoration: BoxDecoration(
                  color: ThemeData.light().scaffoldBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: ThemeData.light().scaffoldBackgroundColor,
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 4),
                      child: Text('Base stats :', style: TextStyle(color: Colors.grey[700])),
                    ),
                    StatBox('HP', stats.hp),
                    StatBox('Attack', stats.atk),
                    StatBox('Defense', stats.def),
                    StatBox('Sp. Atk', stats.spa),
                    StatBox('Sp. Def', stats.spd),
                    StatBox('Speed', stats.spe),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        children: [
                          Container(
                            width: 72,
                            alignment: Alignment.centerRight,
                            margin: const EdgeInsets.only(right: 8),
                            child: Text('Total :', style: TextStyle(color: Colors.grey[600]),),
                          ),
                          Container(
                            width: 32,
                            alignment: Alignment.centerRight,
                            child: Text(
                              '${stats.bst}',
                              style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Evolution: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    FutureBuilder(
                      future: _evoTree(),
                      builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
                        if (snapshot.hasData) {
                          return snapshot.data!;
                        }
                        return Container();
                      },
                    ),
                    if (pokemon.evolution.prevo != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: EvoText(pokemon.evolution),
                      ),
                    /*
                    if (pokemon.otherFormes != null || pokemon.forme != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Formes:',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            _formesList(),
                          ],
                        ),
                      ),
                    if (pokemon.requiredItem != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Row(
                          children: [
                            const Text('Must hold:'),
                            ItemLink(pokemon.requiredItem),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),*/
                  ],
                ),
              ),
            ),

            SliverDbViewer(
              db: db,
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
              sortColumns: ['name', 'accuracy', 'base_power'],
              query: "SELECT * FROM moves INNER JOIN learn_sets ON learn_sets.move_id = moves.id WHERE name_id = '${pokemon.nameId}'",
              rowRenderer: (BuildContext context, int index, Map<String, dynamic> data) {
                final move = Move.fromData(data, db);

                return Container(
                  padding: EdgeInsets.all(8),
                  child: Text(move.name),
                  color: index % 2 == 0 ? const Color(0xffebebf7) : Colors.transparent,
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}

class PokeBox extends StatelessWidget {
  const PokeBox(this.pokemon, {this.label, this.current = false});

  final String? label;
  final bool current;
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /*Navigator.pushReplacement(
          context,
          PageRouteBuilder<PokemonDetails>(
            pageBuilder: (context, _, __) => PokemonDetails(pokemon),
            transitionDuration: const Duration(seconds: 0),
          ),
        );*/
      },
      child: IntrinsicWidth(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Row(
            children: [
              PokemonIcon(pokemon.id),
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  label ?? pokemon.name,
                  style: TextStyle(
                    color: Colors.blue[800],
                    fontWeight: current ? FontWeight.bold : FontWeight.normal,
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class EvoText extends StatelessWidget {
  const EvoText(this.evolution);

  final PokemonEvolutions evolution;

  String _evoMethod() {
    final condition = evolution.evoCondition == null ? '' : ' ${evolution.evoCondition}';

    switch (evolution.evoType) {
      case 'levelExtra':
        return 'level-up$condition';
      case 'levelFriendship':
        return 'level-up with high Friendship$condition';
      case 'levelMove':
        return 'level-up with ${evolution.evoMove}$condition';
      case 'other':
        return condition.trim();
      case 'levelHold':
        return 'level-up holding';
      case 'trade':
        return 'trade${evolution.evoItem != null ? ' holding' : ''}';
      case 'useItem':
        return '';
      default:
        return 'level ${evolution.evoLevel}$condition';
    }
  }

  @override
  Widget build(BuildContext context) {
    return (['trade', 'levelHold', 'useItem'].contains(evolution.evoType)) && evolution.evoItem != null
        ? Row(
            children: [
              Text('Evolves from ${evolution.prevo} (${_evoMethod()}'),
              /*if (['trade', 'levelHold', 'useItem'].contains(evolution.evoType)) ItemLink(evolution.evoItem),*/
              const Text(')'),
            ],
          )
        : Text('Evolves from ${evolution.prevo} (${_evoMethod()})');
  }
}
