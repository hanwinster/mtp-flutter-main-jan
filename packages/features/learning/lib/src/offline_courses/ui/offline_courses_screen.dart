import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/learning.dart';
import 'package:ui/ui.dart';

import '../bloc/offline_courses_bloc.dart';
import 'components/components.dart';

class OfflineCoursesScreen extends StatelessWidget {
  const OfflineCoursesScreen({
    super.key,
    required this.onCourseClick,
  });

  final OfflineCourseClickCallback onCourseClick;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.offlineCoursesTitle),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: BlocBuilder<OfflineCoursesBloc, OfflineCoursesState>(
        buildWhen: (previous, current) =>
            previous.combinedItemsUiState != current.combinedItemsUiState,
        builder: (context, state) {
          return state.combinedItemsUiState.toView(
            context,
            successViewBuilder: (items) {
              return OfflineCourseList(
                items: items,
                onCourseClick: onCourseClick,
              );
            },
            emptyViewBuilder: (_) {
              return MtpEmpty(
                message: context.l10n.offlineCoursesLabelEmptyList,
              );
            },
          );
        },
      ),
    );
  }
}
