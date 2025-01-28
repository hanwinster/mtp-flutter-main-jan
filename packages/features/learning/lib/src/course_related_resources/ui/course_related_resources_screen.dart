import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../bloc/course_related_resources_bloc.dart';
import 'components/components.dart';

class CourseRelatedResourcesScreen extends StatelessWidget {
  const CourseRelatedResourcesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseRelatedResourcesBloc, CourseRelatedResourcesState>(
      buildWhen: (previous, current) =>
          previous.resourcesUiState != current.resourcesUiState,
      builder: (context, state) {
        return state.resourcesUiState.toView(
          context,
          successViewBuilder: (items) {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: Grid.two,
                vertical: Grid.two,
              ),
              separatorBuilder: (context, index) =>
                  const SizedBox(height: Grid.quarter),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return CourseRelatedResourceTile(item: item);
              },
            );
          },
          onRetried: () {
            context
                .read<CourseRelatedResourcesBloc>()
                .add(const CourseRelatedResourcesFetched());
          },
        );
      },
    );
  }
}
