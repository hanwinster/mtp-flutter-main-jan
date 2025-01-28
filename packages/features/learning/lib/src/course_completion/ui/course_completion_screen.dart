import 'package:base/base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_filex/open_filex.dart';
import 'package:ui/ui.dart';

import '../../common/bloc/certificate_downloader_bloc/certificate_downloader_bloc.dart';
import '../../common/bloc/course_learner/bloc.dart';
import '../bloc/course_completion_bloc.dart';

class CourseCompletionScreen extends StatelessWidget {
  const CourseCompletionScreen({
    super.key,
    required this.onCloseEvent,
    required this.onMyCourseEvent,
  });

  final Function() onCloseEvent;
  final Function() onMyCourseEvent;

  @override
  Widget build(BuildContext context) {
    return PopScope<Object?>(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          return;
        }
        onCloseEvent();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: CloseButton(
            onPressed: onCloseEvent,
          ),
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        body: MultiBlocListener(
          listeners: [
            BlocListener<CourseLearnerBloc, CourseLearnerState>(
              listenWhen: (previous, current) =>
                  previous.learnerUiState != current.learnerUiState,
              listener: (context, state) {
                context
                    .read<CourseCompletionBloc>()
                    .add(CourseCompletionLearnerChanged(state.learnerUiState));
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
                }
              },
            ),
          ],
          child: BlocBuilder<CourseCompletionBloc, CourseCompletionState>(
            buildWhen: (previous, current) =>
                previous.learnerUiState != current.learnerUiState,
            builder: (context, state) {
              return state.learnerUiState.toView(
                context,
                successViewBuilder: (learner) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(), // Empty space at the top
                        ),
                        // Congratulations Text
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              Text(
                                context.l10n.courseCompletionLabelTitle,
                                textAlign: TextAlign.center,
                                style: context.textTheme.displaySmall?.copyWith(
                                  color: context.colorScheme.success,
                                ),
                              ),
                              const SizedBox(height: Grid.three),
                              Text(
                                context.l10n.courseCompletionLabelMessage,
                                textAlign: TextAlign.center,
                                style: context.textTheme.headlineSmall,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child:
                              Container(), // More vertical space between message and button
                        ),
                        if (learner.isReadyToGenerateCertificate)
                          BlocBuilder<CertificateDownloaderBloc,
                              CertificateDownloaderState>(
                            buildWhen: (previous, current) =>
                                previous.downloadUiState !=
                                current.downloadUiState,
                            builder: (context, state) {
                              final downloadInProgress =
                                  state.downloadUiState is UiStateInProgress;
                              return ConstrainedBox(
                                constraints: const BoxConstraints(
                                  maxWidth: 300,
                                ),
                                child: MtpPrimarySubmitButton(
                                  isInProgress: downloadInProgress,
                                  onPressed: () {
                                    final courseId = context
                                        .read<CourseCompletionBloc>()
                                        .state
                                        .courseId;
                                    context.read<CertificateDownloaderBloc>().add(
                                        CertificateDownloaderDownloadRequested(
                                            courseId: courseId));
                                  },
                                  labelText: context
                                      .l10n.courseButtonTextGenerateCertificate,
                                ),
                              );
                            },
                          ),
                        Expanded(
                          flex: 1,
                          child: Container(), // Empty space at the bottom
                        ),
                        MtpTextButton(
                          onPressed: onMyCourseEvent,
                          labelText: context
                              .l10n.courseCompletionButtonTextGoToMyCourses,
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(), // Empty space at the bottom
                        ),
                      ],
                    ),
                  );
                },
                showCachedData: false,
              );
            },
          ),
        ),
      ),
    );
  }

  void _openFile(String filePath) async {
    logger.d("Opening file: $filePath");
    final result = await OpenFilex.open(filePath);
    logger.d("Open file result: $result");
  }
}
