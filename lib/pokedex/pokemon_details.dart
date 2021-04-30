import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_db_test/constants.dart';
import 'package:flutter_db_test/database/db.dart';
import 'package:flutter_db_test/database/tables/pokemons.dart';
import 'package:flutter_db_test/sliver_db_viewer.dart';
import 'package:flutter_db_test/widgets/custom_slivers.dart';
import 'package:provider/provider.dart';

import '../widgets/pokemon_icon.dart';
import 'ability_details.dart';
import 'widgets/type_box.dart';
import 'widgets/stat_bar.dart';

class PokemonDetails extends StatelessWidget {
  final Pokemon pokemon;

  PokemonDetails(this.pokemon);

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<MyDatabase>(context);

    final forme = pokemon.formes.forme?.replaceFirst('Totem', '') ?? '';
    final resourceId = pokemon.formes.forme != null ? '${MyDatabase.toId(pokemon.formes.baseSpecies!)}${forme.isEmpty ? '' : '-'}${MyDatabase.toId(forme)}' : pokemon.nameId;
    final abilities = pokemon.abilities.toList;

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
        current = await db.getPokemonByName(current.evolution.prevo!);
      }
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: await _getNextEvo(current),
      );
    }

    Future<Widget> _formesList() async {
      final base = pokemon.formes.forme != null ? await db.getPokemonByName(pokemon.formes.baseSpecies!) : pokemon;
      final name = base.formes.baseForme ?? 'Base';
      final list = [];

      if (base.formes.otherFormes != null) {
        for (final forme in base.formes.otherFormes!) {
          final poke = await db.getPokemonByName(forme);

          list.add(PokeBox(poke, label: poke.formes.forme, current: pokemon.name == poke.name));
        }
      }

      return Wrap(
        spacing: 8,
        direction: Axis.horizontal,
        children: [
          PokeBox(base, label: name, current: base.name == pokemon.name),
          ...list,
        ],
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
        body: DbView(
          db: db,
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
                              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
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
                                    onTap: () async {
                                      final ability = await db.getAbilityByName(abilities[i]!);

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AbilityDetails(
                                            ability,
                                            appBarColor: TypeBox.typeColors[pokemon.types[0]]![0],
                                          ),
                                        ),
                                      );
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
                    StatBar('HP', pokemon.hp),
                    StatBar('Attack', pokemon.atk),
                    StatBar('Defense', pokemon.def),
                    StatBar('Sp. Atk', pokemon.spa),
                    StatBar('Sp. Def', pokemon.spd),
                    StatBar('Speed', pokemon.spe),
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
                              '${pokemon.bst}',
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
                    if (pokemon.formes.otherFormes != null || pokemon.formes.forme != null)
                      Padding(
                        padding: EdgeInsets.only(
                          top: pokemon.evolution.prevo == null && pokemon.evolution.evos == null ? 0 : 4,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Formes:', style: TextStyle(fontWeight: FontWeight.bold)),
                            FutureBuilder(
                              future: _formesList(),
                              builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
                                if (snapshot.hasData) {
                                  return snapshot.data!;
                                }
                                return Container();
                              },
                            )
                          ],
                        ),
                      ),
                    if (pokemon.formes.requiredItem != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Row(
                          children: [
                            const Text('Must hold:'),
                            ItemLink(pokemon.formes.requiredItem!),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
            SliverAppBar(
              pinned: true,
              toolbarHeight: 32,
              leadingWidth: 80,
              elevation: 2.5,
              backgroundColor: ThemeData.light().scaffoldBackgroundColor,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Moves:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
              ),
            ),
          ],
          sortColumns: ['name', 'power', 'accuracy', 'pp'],
          filterColumns: ['type', 'category'],
          query: "SELECT * FROM moves INNER JOIN learn_sets ON learn_sets.move_id = moves.id WHERE name_id = '${pokemon.formes.forme != null ? MyDatabase.toId(pokemon.formes.baseSpecies!) : pokemon.nameId}'",
          rowRenderer: (context, index, data) => Container(
            child: MoveCard(Move.fromData(data, db)),
            color: index % 2 == 0 ? const Color(0xffebebf7) : Colors.transparent,
          ),
        ),
      ),
    );
  }
}

class MyPageRouteBuilder<T> extends PageRouteBuilder {
  MyPageRouteBuilder({
    required RoutePageBuilder pageBuilder,
    Duration transitionDuration = const Duration(milliseconds: 300),
  }) : super(pageBuilder: pageBuilder, transitionDuration: transitionDuration);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    final PageTransitionsTheme theme = Theme.of(context).pageTransitionsTheme;

    return theme.builders[ThemeData().platform]!.buildTransitions(this, context, animation, secondaryAnimation, child);
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
        Navigator.pushReplacement(
          context,
            MyPageRouteBuilder<PokemonDetails>(
              transitionDuration: const Duration(seconds: 0),
              pageBuilder: (context, _, __) => PokemonDetails(pokemon),
            ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            PokemonIcon(pokemon),
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
    );
  }
}

class ItemLink extends StatelessWidget {
  const ItemLink(this.itemName);

  final String itemName;

  @override
  Widget build(BuildContext context) {
    /*final items = Provider.of<Map<String, Item>>(context, listen: false);
    final item = items[Parser.toId(itemName)];*/

    return GestureDetector(
      /*onTap: () => Navigator.push(
        context,
        MaterialPageRoute<void>(builder: (context) => ItemDetails(item)),
      ),*/
      child: Row(
        children: [
          const SizedBox(width: 2),
          //Image.asset('assets/item-icons/${item.spriteNum}.png', height: 16),
          const SizedBox(width: 2),
          Text(
            itemName,
            style: TextStyle(
              color: Colors.blue[800],
              decoration: TextDecoration.underline,
            ),
          ),
        ],
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
              if (['trade', 'levelHold', 'useItem'].contains(evolution.evoType))
                ItemLink(evolution.evoItem!),
              const Text(')'),
            ],
          )
        : Text('Evolves from ${evolution.prevo} (${_evoMethod()})');
  }
}

class MoveCard extends StatelessWidget {
  final Move move;

  const MoveCard(this.move);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: move.shortDesc!,
      preferBelow: false,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          /*onTap: () => Navigator.push(
            context,
            MaterialPageRoute<void>(builder: (context) => MoveDetails(move)),
          ),*/
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 96,
                  child: Text(move.name, overflow: TextOverflow.ellipsis),
                ),
                Row(
                  children: [
                    TypeBox(
                      move.type,
                      pressable: false,
                      width: 48,
                      height: 16,
                      fontSize: 9,
                    ),
                    SizedBox(width: 4),
                    TypeBox(
                      move.category,
                      pressable: false,
                      width: 48,
                      height: 16,
                      fontSize: 9,
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 50,
                        child: (move.basePower > 0)
                            ? Column(
                                children: [
                                  Text('Power', style: TextStyle(fontSize: 9, color: Colors.grey[600])),
                                  Text('${move.basePower}'),
                                ],
                              )
                            : Container(),
                      ),
                      Container(
                        width: 50,
                        child: Column(
                          children: [
                            Text('Accuracy', style: TextStyle(fontSize: 9, color: Colors.grey[600])),
                            Text(move.accuracy != null ? '${move.accuracy}%' : '-'),
                          ],
                        ),
                      ),
                      Container(
                        width: 50,
                        child: Column(
                          children: [
                            Text('PP', style: TextStyle(fontSize: 9, color: Colors.grey[600])),
                            Text('${move.pp}'),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}