import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PokemonIcon extends StatefulWidget {
  final int id;

  const PokemonIcon(this.id);

  @override
  _PokemonIconState createState() => _PokemonIconState();
}

class _PokemonIconState extends State<PokemonIcon> {
  late Future<Image> _future;

  @override
  void initState() {
    super.initState();

    _future = _getIcon('assets/pokemon-icons/${widget.id}.png');
  }

  Future<Image> _getIcon(String path) async {
    try {
      final asset = await rootBundle.load(path);
      return Image.memory(asset.buffer.asUint8List());
    } catch (_) {
      return Image.asset('assets/pokemon-icons/0.png');
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
          return Container();
        }
      },
    );
  }
}