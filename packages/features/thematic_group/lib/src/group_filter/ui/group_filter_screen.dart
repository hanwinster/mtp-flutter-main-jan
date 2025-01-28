import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../bloc/group_filter_bloc.dart';
import 'components/components.dart';

class GroupFilterScreen extends StatelessWidget {
  const GroupFilterScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.groupLabelCategories),
        leading: const CloseButton(),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                final result =
                    context.read<GroupFilterBloc>().state.selectedCategories;
                Navigator.pop(context, result);
              },
              icon: const Icon(Icons.check)),
        ],
      ),
      body: BlocBuilder<GroupFilterBloc, GroupFilterState>(
        buildWhen: (previous, current) =>
            previous.selectedCategories != current.selectedCategories ||
            previous.categoriesUiState != current.categoriesUiState,
        builder: (context, state) {
          return state.categoriesUiState.toView(
            context,
            successViewBuilder: (categories) {
              return CategoryList(items: categories);
            },
          );
        },
      ),
    );
  }
}
