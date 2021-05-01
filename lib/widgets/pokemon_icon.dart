import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_db_test/constants.dart';
import 'package:flutter_db_test/database/db.dart';

class PokemonIcon extends StatefulWidget {
  final Pokemon pokemon;

  const PokemonIcon(this.pokemon);

  @override
  _PokemonIconState createState() => _PokemonIconState();
}

class _PokemonIconState extends State<PokemonIcon> {
  late Future<Image> _future;

  @override
  void initState() {
    super.initState();

    _future = _getIcon('assets/pokemon-icons/${_getIconIndex()}.png');
  }

  int _getIconIndex() {
    final id = widget.pokemon.nameId;

    if (BattlePokemonIconIndexes.containsKey(id)) {
      return BattlePokemonIconIndexes[id]!;
    }
    return widget.pokemon.id;
  }

  Future<Image> _getIcon(String path) async {
    try {
      final asset = await rootBundle.load(path);
      return Image.memory(asset.buffer.asUint8List(), width: 40, height: 30);
    } catch (_) {
      return Image.asset('assets/pokemon-icons/0.png', width: 40, height: 30);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (_, AsyncSnapshot<Image> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return snapshot.data!;
        } else {
          return Container(width: 40, height: 30);
        }
      },
    );
  }
}