import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ui/ui.dart';

import '../offline_courses_screen_entry.dart';

class OfflineCourseListTile extends StatelessWidget {
  const OfflineCourseListTile({
    super.key,
    required this.offlineCourse,
    required this.onCourseClick,
    required this.onRemoveCourse,
  });

  final OfflineCourse offlineCourse;
  final OfflineCourseClickCallback onCourseClick;
  final RemoveOfflineCourseCallback onRemoveCourse;

  @override
  Widget build(BuildContext context) {
    final course = offlineCourse.course;
    return Slidable(
      key: ValueKey(course.id),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => onRemoveCourse(courseId: course.id),
            icon: Icons.delete,
            foregroundColor: context.colorScheme.onError,
            backgroundColor: context.colorScheme.error,
          ),
        ],
      ),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
          side: BorderSide(
            color: context.colorScheme.outline.withOpacity(0.12),
            width: 1,
          ),
        ),
        child: InkWell(
          onTap: () => onCourseClick(courseId: course.id),
          child: Padding(
            padding: const EdgeInsets.only(
              left: Grid.two,
              right: Grid.two,
              top: Grid.two,
              bottom: Grid.one,
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 124,
                      child: AspectRatio(
                        aspectRatio: defaultImageAspectRatio,
                        child: MtpImage(
                          course.coverImage.thumbnail,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                    const SizedBox(width: Grid.two),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MtpHtmlPlainText(
                            offlineCourse.course.title,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: Grid.one),
                          Text(
                            '${course.courseLevel.value} ⚬ ${course.categories.firstOrNull?.name ?? ''}',
                            style: context.textTheme.labelSmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Grid.one),
                const Divider(height: 1),
                Align(
                  alignment: Alignment.centerRight,
                  child: MtpTextButton(
                    onPressed: () => onCourseClick(courseId: course.id),
                    labelText:
                        context.l10n.offlineCoursesButtonTextStartLearning,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
