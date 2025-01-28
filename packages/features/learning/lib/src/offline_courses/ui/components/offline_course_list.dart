import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/src/offline_courses/models/ui_offline_list_item.dart';
import 'package:learning/src/offline_courses/ui/components/components.dart';
import 'package:ui/ui.dart';

import '../../bloc/bloc.dart';
import '../offline_courses_screen_entry.dart';

class OfflineCourseList extends StatelessWidget {
  const OfflineCourseList({
    super.key,
    required this.items,
    required this.onCourseClick,
  });

  final List<UiOfflineListItem> items;
  final OfflineCourseClickCallback onCourseClick;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        horizontal: Grid.one,
        vertical: Grid.two,
      ),
      separatorBuilder: (context, index) => const SizedBox(height: Grid.one),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        if (item is UiOfflineCourseItem) {
          return OfflineCourseListTile(
            offlineCourse: item.course,
            onCourseClick: onCourseClick,
            onRemoveCourse: ({
              required String courseId,
            }) {
              context.read<OfflineCoursesBloc>().add(
                    OfflineCourseRemoved(courseId: courseId),
                  );
            },
          );
        } else if (item is UiOfflineCourseMediaItem) {
          return OfflineCourseMediaTile(
            item: item,
            onRemoveMedia: ({
              required String offlineCourseMediaId,
            }) {
              context.read<OfflineCoursesBloc>().add(
                    OfflineCourseMediaRemoved(id: offlineCourseMediaId),
                  );
            },
          );
        }
        return null;
      },
    );
  }
}
