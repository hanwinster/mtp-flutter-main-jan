import 'package:base/base.dart';
import 'package:blog/src/common/common.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

import '../models/models.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
    required this.items,
    required this.onCategoryTapped,
    this.paddingStart = Grid.zero,
    this.paddingEnd = Grid.zero,
  });

  final List<SelectableCategoryItemState> items;
  final Function(SelectableCategoryItemState) onCategoryTapped;
  final double paddingStart;
  final double paddingEnd;

  @override
  Widget build(BuildContext context) {
    final length = items.length;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: items.mapIndexed((index, item) {
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? paddingStart : Grid.half,
                  right: index == length - 1 ? paddingEnd : Grid.half,
                ),
                child: CategoryListItem(item: item, onTap: onCategoryTapped),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}


class CategoryListLoading extends StatelessWidget {
  const CategoryListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    const length = 5;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List<int>.generate(length, (index) => index).map((index) {
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? Grid.two : Grid.two,
                  right: index == length - 1 ? Grid.two : Grid.zero,
                ),
                child: const CategoryListItemPlaceholder()
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
