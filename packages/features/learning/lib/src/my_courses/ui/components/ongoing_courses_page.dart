import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:ui/ui.dart';

import '../../bloc/bloc.dart';
import '../my_courses_screen_entry.dart';
import 'components.dart';

class OngoingCoursesPage extends StatefulWidget {
  const OngoingCoursesPage({
    super.key,
    required this.onCourseItemEvent,
    required this.onExploreCoursesEvent,
  });

  final MyCourseItemEventHandler onCourseItemEvent;
  final ExploreCoursesEventHandler onExploreCoursesEvent;

  @override
  State<OngoingCoursesPage> createState() => _OngoingCoursesPageState();
}

class _OngoingCoursesPageState extends State<OngoingCoursesPage> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<MyCoursesBloc, MyCoursesState>(
            listenWhen: (previous, current) {
          return previous.ongoingCoursesUiState !=
              current.ongoingCoursesUiState;
        }, listener: (context, state) {
          if (state.ongoingCoursesUiState.isSuccess) {
            if (_refreshController.isRefresh) {
              _refreshController.refreshCompleted();
            }
          } else if (state.ongoingCoursesUiState.isFailure) {
            if (_refreshController.isRefresh) {
              _refreshController.refreshFailed();
            }
          }
        }),
      ],
      child: BlocBuilder<MyCoursesBloc, MyCoursesState>(
        builder: (context, state) {
          return state.ongoingCoursesUiState.toView(
            context,
            successViewBuilder: (items) {
              return SmartRefresher(
                controller: _refreshController,
                enablePullDown: true,
                enablePullUp: false,
                onRefresh: () {
                  context
                      .read<MyCoursesBloc>()
                      .add(const MyCoursesOngoingCoursesRefreshed());
                },
                child: ListView.separated(
                  padding: const EdgeInsets.only(bottom: Grid.two),
                  itemBuilder: (context, index) => OngoingCourseListTile(
                    item: items[index],
                    onTap: () =>
                        widget.onCourseItemEvent(courseId: items[index].id),
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: Grid.half),
                  itemCount: items.length,
                ),
              );
            },
            loadingViewBuilder: (data) => const MtpLoading(),
            emptyViewBuilder: (message) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MtpEmpty(
                  message: context.l10n.courseLableNoUserOngoingCourses,
                ),
                const SizedBox(height: Grid.two),
                MtpOutlinedButton(
                  labelText: context.l10n.courseButtonTextExploreCourses,
                  onPressed: () => widget.onExploreCoursesEvent(),
                )
              ],
            ),
            onRetried: () {
              context
                  .read<MyCoursesBloc>()
                  .add(const MyCoursesOngoingCoursesRefreshed());
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }
}
