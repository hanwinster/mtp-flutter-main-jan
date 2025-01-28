import 'package:base/base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_filex/open_filex.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:ui/ui.dart';

import '../../../common/bloc/certificate_downloader_bloc/certificate_downloader_bloc.dart';
import '../../bloc/bloc.dart';
import '../my_courses_screen_entry.dart';
import 'components.dart';

class CompletedCoursesPage extends StatefulWidget {
  const CompletedCoursesPage({
    super.key,
    required this.onCourseItemEvent,
    required this.onEvaluationEvent,
  });

  final MyCourseItemEventHandler onCourseItemEvent;
  final MyCourseEvaluationEventHandler onEvaluationEvent;

  @override
  State<CompletedCoursesPage> createState() => _CompletedCoursesPageState();
}

class _CompletedCoursesPageState extends State<CompletedCoursesPage> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<MyCoursesBloc, MyCoursesState>(
            listenWhen: (previous, current) {
          return previous.completedCoursesUiState !=
              current.completedCoursesUiState;
        }, listener: (context, state) {
          if (state.completedCoursesUiState.isSuccess) {
            if (_refreshController.isRefresh) {
              _refreshController.refreshCompleted();
            }
          } else if (state.completedCoursesUiState.isFailure) {
            if (_refreshController.isRefresh) {
              _refreshController.refreshFailed();
            }
          }
        }),
        BlocListener<CertificateDownloaderBloc, CertificateDownloaderState>(
            listener: (context, state) {
          if (state.downloadUiState is UiStateSuccess) {
            final filePath = state.downloadUiState.dataOrNull ?? '';
            SnackBarAction? action;
            if (filePath.isNotEmpty) {
              action = SnackBarAction(
                label: context.l10n.courseButtonTextViewCertificate,
                onPressed: () {
                  _openFile(filePath);
                },
              );
            }
            showSnackBar(
              context,
              context.l10n.courseLabelCertificateDownloaded,
              action: action,
            );
          } else if (state.downloadUiState is UiStateFailure) {
            showSnackBar(
                context, state.downloadUiState.messageOrEmpty(context));
          }
        }),
      ],
      child: BlocBuilder<MyCoursesBloc, MyCoursesState>(
        buildWhen: (previous, current) {
          return previous.completedCoursesUiState !=
              current.completedCoursesUiState;
        },
        builder: (context, state) {
          return state.completedCoursesUiState.toView(
            context,
            successViewBuilder: (items) {
              return SmartRefresher(
                controller: _refreshController,
                enablePullDown: true,
                enablePullUp: false,
                onRefresh: () {
                  context
                      .read<MyCoursesBloc>()
                      .add(const MyCoursesCompletedCoursesFetched());
                },
                child: ListView.separated(
                  padding: const EdgeInsets.only(bottom: Grid.two),
                  itemBuilder: (context, index) => CompletedCourseListTile(
                    item: items[index],
                    onTap: () => widget.onCourseItemEvent(
                      courseId: items[index].id,
                    ),
                    onEvaluate: () {
                      final learnerId = items[index].courseLearner?.id ?? '';
                      if (learnerId.isEmpty) return;

                      widget.onEvaluationEvent(
                        courseId: items[index].id,
                        learnerId: learnerId,
                      );
                    },
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: Grid.one),
                  itemCount: items.length,
                ),
              );
            },
            emptyViewBuilder: (message) => MtpEmpty(
              message: context.l10n.courseLableNoUserCompletedCourses,
            ),
            onRetried: () {
              context
                  .read<MyCoursesBloc>()
                  .add(const MyCoursesCompletedCoursesRefreshed());
            },
          );
        },
      ),
    );
  }

  void _openFile(String filePath) async {
    final result = await OpenFilex.open(filePath);
    logger.d("Open file result: $result");
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }
}
