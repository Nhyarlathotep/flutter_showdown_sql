import 'package:flutter/widgets.dart';
import 'package:flutter_db_test/database/db.dart';

class _StatBox extends StatelessWidget {
  final String label;
  final int stat;
  final double width;
  final Color labelColor;

  const _StatBox(
      this.label,
      this.stat, {
        this.width = 28,
        this.labelColor = const Color(0xff888888),
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(label, style: TextStyle(fontSize: 12, color: labelColor)),
          Text('$stat', style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

class StatsBox extends StatelessWidget {
  const StatsBox(this.pokemon);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Row(
                children: [
                  _StatBox('HP', pokemon.hp!),
                  _StatBox('Atk', pokemon.atk!),
                  _StatBox('Def', pokemon.def!),
                ],
              ),
              Row(
                children: [
                  _StatBox('SpA', pokemon.spa!),
                  _StatBox('SpD', pokemon.spd!),
                  _StatBox('Spe', pokemon.spe!),
                ],
              ),
            ],
          ),
          _StatBox('BST', pokemon.bst!, labelColor: const Color(0xff666666)),
        ],
      ),
    );
  }
}