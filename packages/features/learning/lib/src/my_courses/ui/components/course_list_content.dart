import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/learning.dart';
import 'package:learning/src/common/bloc/certificate_downloader_bloc/certificate_downloader_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/bloc.dart';
import 'components.dart';

class CourseListContent extends StatefulWidget {
  const CourseListContent({
    super.key,
    required this.onCourseItemEvent,
    required this.onExploreCoursesEvent,
    required this.onEvaluationEvent,
  });

  final MyCourseItemEventHandler onCourseItemEvent;
  final ExploreCoursesEventHandler onExploreCoursesEvent;
  final MyCourseEvaluationEventHandler onEvaluationEvent;

  @override
  State<CourseListContent> createState() => _CourseListContentState();
}

class _CourseListContentState extends State<CourseListContent> {
  int _currentPageIndex = PageSelector.ongoingPageIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: Grid.two),
        const PageSelector(),
        const SizedBox(height: Grid.one),
        Expanded(
          child: BlocListener<MyCoursesBloc, MyCoursesState>(
            listenWhen: (previous, current) =>
                previous.currentPageIndex != current.currentPageIndex,
            listener: (context, state) {
              setState(() {
                _currentPageIndex = state.currentPageIndex;
              });
            },
            child: IndexedStack(
              index: _currentPageIndex,
              children: [
                OngoingCoursesPage(
                  onCourseItemEvent: widget.onCourseItemEvent,
                  onExploreCoursesEvent: widget.onExploreCoursesEvent,
                ),
                BlocProvider(
                  create: (context) => CertificateDownloaderBloc(),
                  child: CompletedCoursesPage(
                    onCourseItemEvent: widget.onCourseItemEvent,
                    onEvaluationEvent: widget.onEvaluationEvent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
