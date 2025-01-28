import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../bloc/course_list_bloc.dart';
import 'components/components.dart';
import 'course_list_screen_entry.dart';

class CourseListScreen extends StatelessWidget {
  const CourseListScreen({
    super.key,
    required this.onCourseItemEvent,
  });

  final CourseItemEventHandler onCourseItemEvent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const _AppBarTitle(),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Grid.two,
        ),
        child: CourseListContent(
          onCourseItemEvent: onCourseItemEvent,
        ),
      ),
    );
  }
}

class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseListBloc, CourseListState>(
      buildWhen: (previous, current) => previous.filter != current.filter,
      builder: (context, state) {
        return Text(
          state.filter.category?.name ?? 'E-Learning',
        );
      },
    );
  }
}
