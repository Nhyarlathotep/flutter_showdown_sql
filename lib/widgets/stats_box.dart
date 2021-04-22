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
  const StatsBox(this.stats);

  final Stat stats;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Row(
                children: [
                  _StatBox('HP', stats.hp),
                  _StatBox('Atk', stats.atk),
                  _StatBox('Def', stats.def),
                ],
              ),
              Row(
                children: [
                  _StatBox('SpA', stats.spa),
                  _StatBox('SpD', stats.spd),
                  _StatBox('Spe', stats.spe),
                ],
              ),
            ],
          ),
          _StatBox('BST', stats.bst, labelColor: const Color(0xff666666)),
        ],
      ),
    );
  }
}