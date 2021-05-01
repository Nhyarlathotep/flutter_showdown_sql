import 'package:flutter/material.dart';
import 'package:flutter_db_test/database/db.dart';
import 'package:flutter_db_test/pokedex/widgets/type_box.dart';
import 'package:flutter_db_test/widgets/pokemon_icon.dart';

import '../pokemon_details.dart';

class PokemonListItem extends StatelessWidget {
  const PokemonListItem(this.pokemon, this.index);

  final Pokemon pokemon;
  final int index;

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.only(top: 2, bottom: 2, left: 2, right: 4),
              child: PokemonIcon(pokemon),
            ),
            Expanded(child: Text(pokemon.name)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                children: [
                  TypeBox(
                    pokemon.types[0],
                    width: 48,
                    height: 16,
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
                      height: 16,
                      fontSize: 9,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(4),
                        bottomRight: Radius.circular(4),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

