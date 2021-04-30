import 'package:flutter/material.dart';

class StatBar extends StatelessWidget {
  const StatBar(this.label, this.stat);

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