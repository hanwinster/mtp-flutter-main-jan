import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/group_filter_bloc.dart';
import 'group_filter_screen.dart';

class GroupFilterScreenEntry extends StatelessWidget {
  const GroupFilterScreenEntry({
    super.key,
    required this.selectedCategories,
  });

  final List<ThematicGroupCategory> selectedCategories;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GroupFilterBloc(
        selectedCategories: selectedCategories,
      )..add(const GroupFilterCategoriesFetched()),
      child: const GroupFilterScreen(),
    );
  }
}
