import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class CourseSyllabusPage extends StatelessWidget {
  const CourseSyllabusPage({super.key, required this.course});

  final Course course;

  List<Widget> _buildLectureList(
    BuildContext context, {
    required List<Lecture> items,
  }) {
    return items.map((item) {
      if (!item.hasSubmodules) {
        return ListTile(
          title: MtpHtmlPlainText(
            '• ${item.title}',
            textStyle: context.textTheme.bodyLarge,
          ),
        );
      } else {
        return ExpansionTile(
          title: MtpHtml(
            item.title,
            textStyle: context.textTheme.bodyLarge,
          ),
          children: [
            ...item.learningActivities.map(
              (activity) {
                return ListTile(
                  title: MtpHtml(
                    activity.title,
                    textStyle: context.textTheme.bodySmall,
                  ),
                );
              },
            ),
            ...item.quizzes.map(
              (quiz) {
                return ListTile(
                  title: MtpHtml(
                    quiz.title,
                    textStyle: context.textTheme.bodySmall,
                  ),
                );
              },
            ),
            ...item.summaries.map(
              (summary) {
                return ListTile(
                  title: MtpHtml(
                    summary.title,
                    textStyle: context.textTheme.bodySmall,
                  ),
                );
              },
            ),
          ],
        );
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: _buildLectureList(context, items: course.lectures),
          ),
        ),
      ],
    );
  }
}
