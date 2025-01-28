import 'dart:async';

import 'package:base/base.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/src/offline_courses/models/ui_offline_list_item.dart';
import 'package:ui/ui.dart';

part 'offline_courses_event.dart';

part 'offline_courses_state.dart';

class OfflineCoursesBloc
    extends Bloc<OfflineCoursesEvent, OfflineCoursesState> {
  OfflineCoursesBloc({
    ObserveOfflineCoursesUseCase? observeOfflineCoursesUseCase,
    ObserveOfflineCourseMediaListUseCase? observeOfflineCourseMediasUseCase,
    DeleteOfflineCourseUseCase? deleteOfflineCourseUseCase,
    DeleteOfflineCourseMediaUseCase? deleteOfflineCourseMediaUseCase,
  })  : _observeOfflineCoursesUseCase = observeOfflineCoursesUseCase ?? getIt(),
        _observeOfflineCourseMediasUseCase =
            observeOfflineCourseMediasUseCase ?? getIt(),
        _deleteOfflineCourseUseCase = deleteOfflineCourseUseCase ?? getIt(),
        _deleteOfflineCourseMediaUseCase =
            deleteOfflineCourseMediaUseCase ?? getIt(),
        super(OfflineCoursesState.create()) {
    on<OfflineCoursesFetched>(
      _handleOfflineCoursesFetched,
      transformer: restartable(),
    );
    on<OfflineCourseMediasFetched>(
      _handleOfflineCourseMediasFetched,
      transformer: restartable(),
    );
    on<OfflineCourseRemoved>(_handleOfflineCourseRemoved);
    on<OfflineCourseMediaRemoved>(_handleOfflineCourseMediaRemoved);
  }

  final ObserveOfflineCoursesUseCase _observeOfflineCoursesUseCase;
  final ObserveOfflineCourseMediaListUseCase _observeOfflineCourseMediasUseCase;
  final DeleteOfflineCourseUseCase _deleteOfflineCourseUseCase;
  final DeleteOfflineCourseMediaUseCase _deleteOfflineCourseMediaUseCase;

  FutureOr<void> _handleOfflineCoursesFetched(
    OfflineCoursesFetched event,
    Emitter<OfflineCoursesState> emit,
  ) async {
    emit(
      state.copyWith(
        offlineCoursesUiState: const UiStateInProgress(),
      ),
    );

    await emit.forEach(
      _observeOfflineCoursesUseCase(),
      onData: (data) {
        return state.copyWithCoursesUiState(
          offlineCoursesUiState:
              data.isEmpty ? const UiStateEmpty() : UiStateSuccess(data),
        );
      },
      onError: (e, s) => state.copyWith(
        offlineCoursesUiState: UiStateFailure.fromError(e),
      ),
    );
  }

  Future<void> _handleOfflineCourseRemoved(
    OfflineCourseRemoved event,
    Emitter<OfflineCoursesState> emit,
  ) async {
    try {
      await _deleteOfflineCourseUseCase(
        DeleteOfflineCourseUseCaseRequest(courseId: event.courseId),
      );
    } catch (e, s) {
      logger.e('Error removing offline course', e, s);
    }
  }

  Future<void> _handleOfflineCourseMediaRemoved(
    OfflineCourseMediaRemoved event,
    Emitter<OfflineCoursesState> emit,
  ) async {
    try {
      await _deleteOfflineCourseMediaUseCase(
        DeleteOfflineCourseMediaUseCaseRequest(id: event.id),
      );
    } catch (e, s) {
      logger.e('Error removing offline course media', e, s);
    }
  }

  Future<void> _handleOfflineCourseMediasFetched(
    OfflineCourseMediasFetched event,
    Emitter<OfflineCoursesState> emit,
  ) async {
    emit(
      state.copyWith(
        offlineCourseMediasUiState: const UiStateInProgress(),
      ),
    );

    await emit.forEach(
      _observeOfflineCourseMediasUseCase(),
      onData: (data) {
        logger.d('Offline course medias fetched: ${data.length}');
        return state.copyWithMediasUiState(
          offlineCourseMediasUiState:
              data.isEmpty ? const UiStateEmpty() : UiStateSuccess(data),
        );
      },
      onError: (e, s) => state.copyWith(
        offlineCourseMediasUiState: UiStateFailure.fromError(e),
      ),
    );
  }
}