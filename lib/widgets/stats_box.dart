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

class StatBox extends StatelessWidget {
  const StatBox(this.label, this.stat);

  final String label;
  final int stat;

  @override
  Widget build(BuildContext context) {
    final int width = stat.clamp(0, 200).toInt();
    final int color = (stat * 180 / 255).clamp(0, 360).floor();

    return Row(
      children: [
        Container(
          width: 72,
          margin: const EdgeInsets.only(right: 8),
          alignment: Alignment.centerRight,
          child: Text('$label :'),
        ),
        Container(
          width: 32,
          margin: const EdgeInsets.only(right: 8),
          alignment: Alignment.centerRight,
          child: Text('$stat', style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
        Expanded(
          child: Stack(
            children: [
              Container(
                height: 12,
                width: width.toDouble(),
                decoration: BoxDecoration(
                  border: Border.all(color: HSLColor.fromAHSL(1, color.toDouble(), 0.75, 0.35).toColor()),
                  borderRadius: BorderRadius.circular(2),
                  color: HSLColor.fromAHSL(1, color.toDouble(), 0.85, 0.45).toColor(),
                ),
              ),
              Positioned(
                top: 1,
                left: 1,
                child: Container(
                  height: 3.2,
                  width: width.toDouble() - (width < 2 ? width : 2),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(2), topRight: Radius.circular(2)),
                    color: HSLColor.fromAHSL(1, color.toDouble(), 0.85, 0.55).toColor(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
