import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:moor/moor.dart' as moor;

import 'search_bar.dart';

class Tuple<T, E> {
  T first;
  E second;

  Tuple(this.first, this.second);

  String toString() => '($first, $second)';
}

class SliverDbViewer extends StatefulWidget {
  final moor.GeneratedDatabase db;
  final String query;
  final List<String> sortColumns;
  final List<String> filterColumns;
  final Widget Function(BuildContext context, int index, Map<String, dynamic> data) rowRenderer;
  final EdgeInsets padding;

  SliverDbViewer({
    this.padding: EdgeInsets.zero,
    required this.db,
    required this.query,
    this.sortColumns = const [],
    this.filterColumns = const [],
    required this.rowRenderer,
  });

  @override
  _SliverDbViewerState createState() => _SliverDbViewerState();
}

class _SliverDbViewerState extends State<SliverDbViewer> {
  String filterRule = '';
  Tuple<String, bool> sortRule = Tuple('', true);
  late Map<String, List<String>> filters;
  late Future<List<moor.QueryRow>> queryResult;

  @override
  void initState() {
    super.initState();

    queryResult = widget.db.customSelect(widget.query).get();
    filters = Map.fromIterable(widget.filterColumns, key: (e) => e, value: (e) => []);
  }

  void _updateQuery() {
    String sortQuery = '';
    String filterQuery = '';

    if (sortRule.first.isNotEmpty) {
      sortQuery = 'ORDER BY ${sortRule.first} ${sortRule.second ? '' : 'DESC'}';
    }
    if (filters.entries.any((e) => e.value.isNotEmpty)) {
      for (int i = 0; i < filters.length; i++) {
        final filter = filters.entries.elementAt(i);

        if (i > 0 && filter.value.isNotEmpty && filters.entries.elementAt(i - 1).value.isNotEmpty)
          filterQuery += ') and (';
        for (int j = 0; j < filter.value.length; j++) {
          if (j > 0)
            filterQuery += ' or ';
          filterQuery += "${filter.key} LIKE '%\"${filter.value[j]}\"%'";
        }
      }
      filterQuery = 'WHERE ($filterQuery)';
    }
    queryResult = widget.db.customSelect('${widget.query} $filterQuery $sortQuery').get();
  }

  void _updateSortRule(String columnName) {
    if (sortRule.first == columnName) {
      if (sortRule.second) {
        sortRule.second = false;
      } else {
        sortRule = Tuple('', true);
      }
    } else {
      sortRule = Tuple(columnName, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      /// Fix issue: https://github.com/flutter/flutter/issues/55170
      padding: widget.padding,
      sliver: FutureBuilder(
        future: queryResult,
        builder: (BuildContext context, AsyncSnapshot<List<moor.QueryRow>> snapshot) {
          if (snapshot.hasData) {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index == 0) {
                    return Card(
                      child: Wrap(
                        spacing: 4,
                        alignment: WrapAlignment.spaceEvenly,
                        children: [
                          ...widget.sortColumns.map(
                                (c) => _HeadingCell(
                              label: c,
                              onTap: () {
                                setState(() {
                                  filterRule = '';
                                  _updateSortRule(c);
                                  _updateQuery();
                                });
                              },
                              visible: sortRule.first == c,
                              sorted: sortRule.second,
                            ),
                          ),
                          ...widget.filterColumns.map(
                                (c) => _HeadingCell(
                              label: c,
                              onTap: () {
                                setState(() {
                                  filterRule = filterRule == c ? '' : c;
                                });
                              },
                              visible: false,
                              sorted: null,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return widget.rowRenderer(context, index - 1, snapshot.data![index - 1].data);
                },
                childCount: snapshot.data!.length + 1,
              ),
            );
          }
          return SliverFillRemaining(child: Center(child: CircularProgressIndicator()));
        },
      ),
    );

    /*return NestedScrollView(
            physics: NeverScrollableScrollPhysics(),
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                if (filters.isNotEmpty)
                  SliverToBoxAdapter(
                    child: Wrap(
                        children: [
                          for (final entry in filters.entries)
                            ...entry.value.map(
                                  (f) => InputChip(
                                label: Text(f),
                                padding: EdgeInsets.all(2.0),
                                onDeleted: () {
                                  setState(() {
                                    filters[entry.key]!.remove(f);
                                    _updateQuery();
                                  });
                                },
                                backgroundColor: Colors.lightBlue[100],
                              ),
                            ),
                        ]
                    ),
                  ),
                SliverToBoxAdapter(
                  child: Card(
                    child: Wrap(
                      spacing: 4,
                      alignment: WrapAlignment.spaceEvenly,
                      children: [
                        ...widget.sortColumns.map(
                          (c) => _HeadingCell(
                            label: c,
                            onTap: () {
                              setState(() {
                                filterRule = '';
                                _updateSortRule(c);
                                _updateQuery();
                              });
                            },
                            visible: sortRule.first == c,
                            sorted: sortRule.second,
                          ),
                        ),
                        ...widget.filterColumns.map(
                          (c) => _HeadingCell(
                            label: c,
                            onTap: () {
                              setState(() {
                                filterRule = filterRule == c ? '' : c;
                              });
                            },
                            visible: false,
                            sorted: null,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (filterRule.isNotEmpty)
                  SliverToBoxAdapter(
                    child: SearchBar(
                      clearOnSubmit: true,
                      onSearch: (query) {
                        setState(() {
                          filters[filterRule]!.add(query);
                          _updateQuery();
                        });
                      },
                    ),
                  ),
              ];
            },
            body: ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return widget.rowRenderer(context, index, snapshot.data![index].data);
              },
            ),
          );
        return Center(child: CircularProgressIndicator());
      },
    );*/
  }
}

/// From [DataTable]
class _SortArrow extends StatefulWidget {
  const _SortArrow({
    Key? key,
    required this.visible,
    required this.up,
    required this.duration,
  }) : super(key: key);

  final bool visible;

  final bool? up;

  final Duration duration;

  @override
  _SortArrowState createState() => _SortArrowState();
}

class _SortArrowState extends State<_SortArrow> with TickerProviderStateMixin {
  late AnimationController _opacityController;
  late Animation<double> _opacityAnimation;

  late AnimationController _orientationController;
  late Animation<double> _orientationAnimation;
  double _orientationOffset = 0.0;

  bool? _up;

  static final Animatable<double> _turnTween = Tween<double>(begin: 0.0, end: pi).chain(CurveTween(curve: Curves.easeIn));

  @override
  void initState() {
    super.initState();
    _opacityAnimation = CurvedAnimation(
      parent: _opacityController = AnimationController(
        duration: widget.duration,
        vsync: this,
      ),
      curve: Curves.fastOutSlowIn,
    )..addListener(_rebuild);
    _opacityController.value = widget.visible ? 1.0 : 0.0;
    _orientationController = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _orientationAnimation = _orientationController.drive(_turnTween)
      ..addListener(_rebuild)
      ..addStatusListener(_resetOrientationAnimation);
    if (widget.visible) _orientationOffset = widget.up! ? 0.0 : pi;
  }

  void _rebuild() {
    setState(() {
      // The animations changed, so we need to rebuild.
    });
  }

  void _resetOrientationAnimation(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      assert(_orientationAnimation.value == pi);
      _orientationOffset += pi;
      _orientationController.value = 0.0;
    }
  }

  @override
  void didUpdateWidget(_SortArrow oldWidget) {
    super.didUpdateWidget(oldWidget);
    bool skipArrow = false;
    final bool? newUp = widget.up ?? _up;
    if (oldWidget.visible != widget.visible) {
      if (widget.visible &&
          (_opacityController.status == AnimationStatus.dismissed)) {
        _orientationController.stop();
        _orientationController.value = 0.0;
        _orientationOffset = newUp! ? 0.0 : pi;
        skipArrow = true;
      }
      if (widget.visible) {
        _opacityController.forward();
      } else {
        _opacityController.reverse();
      }
    }
    if ((_up != newUp) && !skipArrow) {
      if (_orientationController.status == AnimationStatus.dismissed) {
        _orientationController.forward();
      } else {
        _orientationController.reverse();
      }
    }
    _up = newUp;
  }

  @override
  void dispose() {
    _opacityController.dispose();
    _orientationController.dispose();
    super.dispose();
  }

  static const double _arrowIconBaselineOffset = -1.5;
  static const double _arrowIconSize = 16.0;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _opacityAnimation.value,
      child: Transform(
        transform: Matrix4.rotationZ(_orientationOffset + _orientationAnimation.value)..setTranslationRaw(0, _arrowIconBaselineOffset, 0.0),
        alignment: Alignment.center,
        child: const Icon(
          Icons.arrow_drop_up,
          size: _arrowIconSize,
        ),
      ),
    );
  }
}

class _HeadingCell extends StatelessWidget {
  final String label;
  final bool? sorted;
  final bool visible;
  final VoidCallback onTap;

  const _HeadingCell({
    required this.label,
    required this.sorted,
    required this.visible,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextStyle style = themeData.textTheme.subtitle2!;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 4),
        child: AnimatedDefaultTextStyle(
          style: style,
          softWrap: false,
          duration: Duration(milliseconds: 150),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(label),
              if (sorted != null)
                _SortArrow(
                  up: sorted,
                  visible: visible,
                  duration: Duration(milliseconds: 150),
                ),
            ],
          ),
        ),
      ),
    );
  }
}