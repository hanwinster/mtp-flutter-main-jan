import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thematic_group/src/group_filter/ui/components/category_check_box_list_tile.dart';
import 'package:ui/ui.dart';

import '../../bloc/bloc.dart';

class AllCategoriesTitle extends StatelessWidget {
  const AllCategoriesTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupFilterBloc, GroupFilterState>(
      buildWhen: (previous, current) =>
          previous.selectedCategories != current.selectedCategories ||
          previous.categoriesUiState != current.categoriesUiState,
      builder: (context, state) {
        return CategoryCheckBoxListTile(
          text: context.l10n.groupLabelFilterAllCategories,
          value: state.hasSelectedAll,
          onChanged: (value) {
            if (value == null) return;

            context.read<GroupFilterBloc>().add(
              GroupFilterAllCategoriesCheckChanged(value),
            );
          },
        );
      },
    );
  }
}
