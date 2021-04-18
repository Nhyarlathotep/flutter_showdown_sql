import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final bool clearOnSubmit;
  final Function(String) onSearch;

  const SearchBar({
    this.clearOnSubmit = false,
    required this.onSearch,
  });

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onSubmitted: (query) {
        widget.onSearch(query);
        if (widget.clearOnSubmit)
          _controller.clear();
      },
      textAlignVertical: TextAlignVertical.center,
    );
  }
}