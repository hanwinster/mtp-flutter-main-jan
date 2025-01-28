import 'dart:async';
import 'dart:convert';

import 'package:background_downloader/background_downloader.dart';
import 'package:base/base.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/domain.dart';
import 'package:file_downloader/file_downloader.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:ui/ui.dart';

part 'course_detail_event.dart';

part 'course_detail_state.dart';

const downloadThrottleDuration = Duration(seconds: 1);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class CourseDetailBloc extends Bloc<CourseDetailEvent, CourseDetailState> {
  CourseDetailBloc({
    required String courseId,
    required bool isEnrolled,
    required bool isOfflineMode,
    ObserveCourseUseCase? observeCourseUseCase,
    TakeCourseUseCase? takeCourseUseCase,
    ObserveCourseDownloadStatusUseCase? observeCourseDownloadStatusUseCase,
    MarkCourseDownloadStatusAsHandledUseCase?
        markCourseDownloadStatusAsHandledUseCase,
    MtpFileDownloader? fileDownloader,
  })  : _observeCourseUseCase = observeCourseUseCase ?? getIt(),
        _takeCourseUseCase = takeCourseUseCase ?? getIt(),
        _fileDownloader = fileDownloader ?? getIt(),
        _observeCourseDownloadStatusUseCase =
            observeCourseDownloadStatusUseCase ?? getIt(),
        _markCourseDownloadStatusAsHandledUseCase =
            markCourseDownloadStatusAsHandledUseCase ?? getIt(),
        super(CourseDetailState.create(
          courseId: courseId,
          isEnrolled: isEnrolled,
          isOfflineMode: isOfflineMode,
        )) {
    on<CourseDetailFetched>(
      _handleCourseFetched,
      transformer: restartable(),
    );
    on<CourseDetailEnrolled>(_handleEnrolled);
    on<CourseDetailDownloaded>(
      _handleDownloaded,
      transformer: throttleDroppable(downloadThrottleDuration),
    );
    on<CourseDetailDownloadStatusFetched>(_handleDownloadStatusFetched);
    on<CourseDetailDownloadStatusHandled>(_handleDownloadStatusHandled);

    on<CourseDetailResourceRequested>(_handleResourceRequested);
  }

  final ObserveCourseUseCase _observeCourseUseCase;
  final TakeCourseUseCase _takeCourseUseCase;
  final ObserveCourseDownloadStatusUseCase _observeCourseDownloadStatusUseCase;
  final MarkCourseDownloadStatusAsHandledUseCase
      _markCourseDownloadStatusAsHandledUseCase;
  final MtpFileDownloader _fileDownloader;

  Future<void> _handleCourseFetched(
    CourseDetailFetched event,
    Emitter<CourseDetailState> emit,
  ) async {
    emit(
      state.copyWith(
        courseUiState: const UiStateInProgress(),
      ),
    );

    await emit.forEach(
      _observeCourseUseCase(ObserveCourseUseCaseRequest(
        courseId: event.courseId,
        forceRefresh: !state.isOfflineMode,
      )),
      onData: (result) => state.copyWith(
        courseUiState: UiState.fromResult(result),
      ),
      onError: (e, s) => state.copyWith(
        courseUiState: UiStateFailure.fromError(e),
      ),
    );
  }

  Future<void> _handleEnrolled(
    CourseDetailEnrolled event,
    Emitter<CourseDetailState> emit,
  ) async {
    emit(
      state.copyWith(
        enrolledUiState: const UiStateInProgress(),
      ),
    );

    try {
      final result = await _takeCourseUseCase(
        TakeCourseUseCaseRequest(
          courseId: event.courseId,
        ),
      );

      emit(
        state.copyWith(
          enrolledUiState: UiStateSuccess(result),
          courseUiState: state.courseUiState.map(
            (course) => course.copyWith(
              courseLearner: result,
              hasUserTakenCourse: true,
            ),
          ),
        ),
      );
    } catch (e, s) {
      logger.e('Error when take course', e, s);
      emit(
        state.copyWith(
          enrolledUiState: UiStateFailure.fromError(e),
        ),
      );
    }
  }

  Future<void> _handleDownloaded(
    CourseDetailDownloaded event,
    Emitter<CourseDetailState> emit,
  ) async {
    emit(
      state.copyWith(
        courseDownloadUiState: const UiStateInProgress(),
      ),
    );

    try {
      await _fileDownloader.downloadCourse(
        courseId: event.courseId,
      );
    } catch (e, s) {
      logger.e('Error when download course', e, s);
      emit(
        state.copyWith(
          courseDownloadUiState: UiStateFailure.fromError(e),
        ),
      );
    }
  }

  Future<void> _handleDownloadStatusFetched(
    CourseDetailDownloadStatusFetched event,
    Emitter<CourseDetailState> emit,
  ) async {
    await emit.forEach(
      _observeCourseDownloadStatusUseCase(
          ObserveCourseDownloadStatusUseCaseRequest(
        courseId: event.courseId,
      )),
      onData: (result) {
        logger.d('Download status: $result');
        if (result == null) {
          return state.copyWith(
            courseDownloadUiState: const UiStateInitial(),
          );
        }

        final taskRecord =
            TaskRecord.fromJson(jsonDecode(result.downloadRecordJson));
        if (taskRecord.status == TaskStatus.complete) {
          return state.copyWith(
            courseDownloadUiState: UiStateSuccess(result),
          );
        } else if (taskRecord.status == TaskStatus.running ||
            taskRecord.status == TaskStatus.enqueued) {
          return state.copyWith(
            courseDownloadUiState: const UiStateInProgress(),
          );
        } else if (taskRecord.exception != null) {
          final errors = jsonDecode(taskRecord.exception?.description ?? '')
              as Map<String, dynamic>;
          final message = errors['message'] as String? ?? '';
          final formattedMessage = 'Download failed: $message';

          return state.copyWith(
            courseDownloadUiState: UiStateFailure.fromException(
                UnknownDomainException(formattedMessage)),
          );
        }
        logger.d('Download status: $result');
        return state.copyWith();
      },
      onError: (e, s) {
        logger.e('Error when observe download status', e, s);
        return state.copyWith(
          courseDownloadUiState: UiStateFailure.fromError(e),
        );
      },
    );
  }

  Future<void> _handleDownloadStatusHandled(
    CourseDetailDownloadStatusHandled event,
    Emitter<CourseDetailState> emit,
  ) async {
    try {
      await _markCourseDownloadStatusAsHandledUseCase(
        MarkCourseDownloadStatusAsHandledUseCaseRequest(
          courseId: event.courseId,
        ),
      );
    } catch (e, s) {
      logger.e('Error when mark download status as handled', e, s);
    }
  }

  Future<void> _handleResourceRequested(
    CourseDetailResourceRequested event,
    Emitter<CourseDetailState> emit,
  ) async {
    emit(
      state.copyWith(
        resourceDownloadUiState: const UiStateInProgress(),
      ),
    );

    try {
      final url = event.url;
      final filePath = await _fileDownloader.downloadFile(url);
      emit(
        state.copyWith(
          resourceDownloadUiState: UiStateSuccess(filePath),
        ),
      );
    } catch (e, s) {
      logger.e('Error when download resource', e, s);
      emit(
        state.copyWith(
          resourceDownloadUiState: UiStateFailure.fromError(e),
        ),
      );
    }
  }
}
