import 'package:flutter/material.dart';
import 'package:flutter_db_test/database/db.dart';
import 'package:flutter_db_test/pokedex/widgets/type_box.dart';
import 'package:flutter_db_test/widgets/pokemon_icon.dart';

import '../pokemon_details.dart';

class PokemonListItem extends StatelessWidget {
  const PokemonListItem(this.pokemon, this.index);

  final Pokemon pokemon;
  final int index;

  String _getAbility(int index) {
    final abilities = pokemon.abilities.toList;

    int j = 0;
    for (int i = 0; i < abilities.length; i++) {
      if (abilities[i] != null) {
        if (j == index)
          return abilities[i]!;
        j++;
      }
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    final abilities = pokemon.abilities.toList.where((e) => e != null).toList();

    return Material(
      color: index % 2 == 0 ? const Color(0xffebebf7) : Colors.transparent,
      child: InkWell(
        onTap: () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => PokemonDetails(pokemon),
          ),
        ),
        child: Row(
          children: [
            Padding(
              key: UniqueKey(),
              padding: EdgeInsets.symmetric(vertical: 2),
              child: PokemonIcon(pokemon),
            ),
            Expanded(
              flex: 2,
              child: Text(pokemon.name, overflow: TextOverflow.ellipsis),
            ),
            SizedBox(
              width: 48 * 2,
              child: Row(
                children: [
                  TypeBox(
                    pokemon.types[0],
                    width: 48,
                    height: 18,
                    fontSize: 9,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(4),
                      bottomLeft: const Radius.circular(4),
                      topRight: Radius.circular(pokemon.types.length > 1 ? 0 : 4),
                      bottomRight: Radius.circular(pokemon.types.length > 1 ? 0 : 4),
                    ),
                  ),
                  if (pokemon.types.length > 1)
                    TypeBox(
                      pokemon.types[1],
                      width: 48,
                      height: 18,
                      fontSize: 9,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(4),
                        bottomRight: Radius.circular(4),
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(abilities[0]!, style: TextStyle(fontSize: 10), overflow: TextOverflow.ellipsis),
                          if (abilities.length > 2)
                            Text(_getAbility(2), style: TextStyle(fontSize: 10), overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (abilities.length > 1)
                            Text(_getAbility(1), style: TextStyle(fontSize: 10), overflow: TextOverflow.ellipsis),
                          if (abilities.length > 3)
                            Text(_getAbility(3), style: TextStyle(fontSize: 10), overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

