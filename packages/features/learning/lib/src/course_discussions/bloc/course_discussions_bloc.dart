import 'dart:async';

import 'package:base/base.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/src/course_discussions/models/models.dart';
import 'package:ui/ui.dart';

part 'course_discussions_event.dart';

part 'course_discussions_state.dart';

class CourseDiscussionsBloc
    extends Bloc<CourseDiscussionsEvent, CourseDiscussionsState> {
  CourseDiscussionsBloc({
    required String courseId,
    required String discussionId,
    ObserveCourseDiscussionMessagesUseCase?
        observeCourseDiscussionMessagesUseCase,
    CreateCourseDiscussionMessageUseCase? createCourseDiscussionMessageUseCase,
    GetCurrentUserIdUseCase? getCurrentUserIdUseCase,
  })  : _observeCourseDiscussionMessagesUseCase =
            observeCourseDiscussionMessagesUseCase ?? getIt(),
        _createCourseDiscussionMessageUseCase =
            createCourseDiscussionMessageUseCase ?? getIt(),
        _getCurrentUserIdUseCase = getCurrentUserIdUseCase ?? getIt(),
        super(CourseDiscussionsState.create(
          courseId: courseId,
          discussionId: discussionId,
        )) {
    on<CourseDiscussionsMessagesFetched>(
      _handleMessagesFetched,
      transformer: restartable(),
    );
    on<CourseDiscussionMessageChanged>(
      _handleMessageChanged,
    );
    on<CourseDiscussionMessageSubmitted>(
      _handleMessageSubmitted,
    );
  }

  final ObserveCourseDiscussionMessagesUseCase
      _observeCourseDiscussionMessagesUseCase;
  final CreateCourseDiscussionMessageUseCase
      _createCourseDiscussionMessageUseCase;
  final GetCurrentUserIdUseCase _getCurrentUserIdUseCase;

  FutureOr<void> _handleMessagesFetched(
    CourseDiscussionsMessagesFetched event,
    Emitter<CourseDiscussionsState> emit,
  ) async {
    emit(
      state.copyWith(
        messagesUiState: const UiStateInProgress(),
      ),
    );

    final currentUserId = await _getCurrentUserIdUseCase();
    await emit.forEach(
      _observeCourseDiscussionMessagesUseCase(
          ObserveCourseDiscussionMessagesUseCaseRequest(
        courseId: state.courseId,
      )),
      onData: (result) => state.copyWith(
        messagesUiState: UiState.fromResultTransform(
          result,
          (messages) => messages
              .map(
                (message) => UiDiscussionMessageItem(
                  message: message,
                  isMine: message.user?.id == currentUserId,
                ),
              )
              .toList(),
        ),
      ),
      onError: (e, s) => state.copyWith(
        messagesUiState: UiStateFailure.fromError(e),
      ),
    );
  }

  Future<void> _handleMessageChanged(
    CourseDiscussionMessageChanged event,
    Emitter<CourseDiscussionsState> emit,
  ) async {
    final newValue = MessageState.newValue(state.messageState, event.message);
    emit(
      state.copyWith(
        messageState: newValue,
        messageError: () => newValue.displayError,
      ),
    );
  }

  Future<void> _handleMessageSubmitted(
    CourseDiscussionMessageSubmitted event,
    Emitter<CourseDiscussionsState> emit,
  ) async {
    final validatedMessage = MessageState.validated(state.messageState.value);

    emit(state.copyWith(
      messageState: validatedMessage,
      messageError: () => validatedMessage.displayError,
    ));

    final isValid = validatedMessage.isValid;
    if (!isValid) {
      return;
    }

    emit(state.copyWith(
      messageSubmissionState: const UiStateInProgress(),
    ));
    try {
      final result = await _createCourseDiscussionMessageUseCase(
          CreateCourseDiscussionMessageUseCaseRequest(
        courseId: state.courseId,
        discussionId: state.discussionId,
        message: validatedMessage.value,
      ));
      emit(
        state.copyWith(
          messageSubmissionState: const UiStateSuccess(NullValue()),
        ),
      );
    } catch (e, s) {
      logger.e('Error submitting review', e, s);
      emit(
        state.copyWith(
          messageSubmissionState: UiStateFailure.fromError(e),
        ),
      );
    }
  }
}
