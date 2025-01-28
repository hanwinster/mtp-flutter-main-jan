import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thematic_group/src/group_filter/models/models.dart';
import 'package:thematic_group/src/group_filter/ui/components/category_check_box_list_tile.dart';
import 'package:ui/ui.dart';

import '../../bloc/bloc.dart';
import 'all_categories_title.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key, required this.items});

  final List<UiCategoryListItem> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: Grid.two),
      shrinkWrap: true,
      itemCount: items.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AllCategoriesTitle(),
              Divider(),
            ],
          );
        }
        final item = items[index - 1];
        return CategoryCheckBoxListTile(
          text: item.category.name,
          value: item.isSelected,
          onChanged: (value) {
            if (value == null) return;

            context.read<GroupFilterBloc>().add(
                  GroupFilterCategoryCheckChanged(item.category, value),
                );
          },
        );
      },
    );
  }
}
