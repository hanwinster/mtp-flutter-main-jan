import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_filex/open_filex.dart';
import 'package:ui/ui.dart';

import '../../common/bloc/certificate_downloader_bloc/certificate_downloader_bloc.dart';
import '../bloc/course_detail_bloc.dart';
import 'components/components.dart';

import 'course_detail_screen_entry.dart';

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({
    super.key,
    required this.courseId,
    required this.isLoggedIn,
    required this.onLaunchCourseEvent,
    required this.onGoToOfflineCoursesEvent,
    required this.onLoginEvent,
  });

  final String courseId;
  final bool isLoggedIn;
  final LaunchCourseEventHandler onLaunchCourseEvent;
  final GoToOfflineCoursesEventHandler onGoToOfflineCoursesEvent;
  final LoginEventEventHandler onLoginEvent;

  Future<void> _handleEnrolledUiState(
      BuildContext context, UiState<CourseLearner> enrolledUiState) async {
    if (enrolledUiState is UiStateSuccess) {
      final learnerId = enrolledUiState.dataOrNull?.id ?? '';
      if (learnerId.isEmpty) {
        // This should never happen
        logger.w('Learner ID is empty');
        return;
      }

      onLaunchCourseEvent(
        courseId: courseId,
        learnerId: learnerId,
      );
    } else if (enrolledUiState is UiStateFailure) {
      if ((enrolledUiState as UiStateFailure).isUnauthorized) {
        final result = await onLoginEvent();
        if (result) {
          if (!context.mounted) return;
          context.read<CourseDetailBloc>().add(CourseDetailFetched(courseId));
        }
      } else {
        showSnackBar(context, enrolledUiState.messageOrEmpty(context));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<CourseDetailBloc, CourseDetailState>(
            listenWhen: (previous, current) =>
                previous.enrolledUiState != current.enrolledUiState,
            listener: (context, state) {
              _handleEnrolledUiState(context, state.enrolledUiState);
            },
          ),
          BlocListener<CertificateDownloaderBloc, CertificateDownloaderState>(
              listenWhen: (previous, current) =>
                  previous.downloadUiState != current.downloadUiState,
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
          BlocListener<CourseDetailBloc, CourseDetailState>(
            listenWhen: (previous, current) =>
                previous.courseDownloadUiState != current.courseDownloadUiState,
            listener: (context, state) {
              if (state.courseDownloadUiState.dataOrNull?.isHandled == true) {
                return;
              }

              if (state.courseDownloadUiState is UiStateSuccess) {
                showSnackBar(
                  context,
                  context.l10n.courseLabelDownloadCourseSuccessfully,
                );
              } else if (state.courseDownloadUiState is UiStateFailure) {
                showSnackBar(context,
                    state.courseDownloadUiState.messageOrEmpty(context));
              }

              context.read<CourseDetailBloc>().add(
                    CourseDetailDownloadStatusHandled(courseId),
                  );
            },
          ),
        ],
        child: BlocBuilder<CourseDetailBloc, CourseDetailState>(
          buildWhen: (previous, current) =>
              previous.courseUiState != current.courseUiState,
          builder: (context, state) {
            return state.courseUiState.toView(
              context,
              successViewBuilder: (course) {
                return CourseDetailContent(
                  course: course,
                  isLoggedIn: isLoggedIn,
                  isOfflineMode: state.isOfflineMode,
                  onLaunchCourseEvent: onLaunchCourseEvent,
                  onGoToOfflineCoursesEvent: onGoToOfflineCoursesEvent,
                  onLoginEvent: onLoginEvent,
                );
              },
            );
          },
        ),
      ),
    );
  }

  void _openFile(String filePath) async {
    final result = await OpenFilex.open(filePath);
    logger.d("Open file result: $result");
  }
}
