part of 'offline_courses_bloc.dart';

final class OfflineCoursesState extends Equatable {
  const OfflineCoursesState({
    this.offlineCoursesUiState = const UiStateInitial(),
    this.offlineCourseMediasUiState = const UiStateInitial(),
    this.combinedItemsUiState = const UiStateInitial(),
  });

  final UiState<List<OfflineCourse>> offlineCoursesUiState;
  final UiState<List<OfflineCourseMedia>> offlineCourseMediasUiState;
  final UiState<List<UiOfflineListItem>> combinedItemsUiState;

  factory OfflineCoursesState.create() {
    return const OfflineCoursesState();
  }

  @override
  List<Object> get props => [
        offlineCoursesUiState,
        offlineCourseMediasUiState,
        combinedItemsUiState,
      ];

  OfflineCoursesState copyWith({
    UiState<List<OfflineCourse>>? offlineCoursesUiState,
    UiState<List<OfflineCourseMedia>>? offlineCourseMediasUiState,
    UiState<List<UiOfflineListItem>>? combinedItemsUiState,
  }) {
    return OfflineCoursesState(
      offlineCoursesUiState:
          offlineCoursesUiState ?? this.offlineCoursesUiState,
      offlineCourseMediasUiState:
          offlineCourseMediasUiState ?? this.offlineCourseMediasUiState,
      combinedItemsUiState: combinedItemsUiState ?? this.combinedItemsUiState,
    );
  }

  OfflineCoursesState copyWithMediasUiState({
    required UiState<List<OfflineCourseMedia>> offlineCourseMediasUiState,
  }) {
    return copyWith(
      offlineCourseMediasUiState: offlineCourseMediasUiState,
      combinedItemsUiState: combineUiState(
        offlineCoursesUiState: offlineCoursesUiState,
        offlineCourseMediasUiState: offlineCourseMediasUiState,
      ),
    );
  }

  OfflineCoursesState copyWithCoursesUiState({
    required UiState<List<OfflineCourse>> offlineCoursesUiState,
  }) {
    return copyWith(
      offlineCoursesUiState: offlineCoursesUiState,
      combinedItemsUiState: combineUiState(
        offlineCoursesUiState: offlineCoursesUiState,
        offlineCourseMediasUiState: offlineCourseMediasUiState,
      ),
    );
  }

  UiState<List<UiOfflineListItem>> combineUiState({
    required UiState<List<OfflineCourse>> offlineCoursesUiState,
    required UiState<List<OfflineCourseMedia>> offlineCourseMediasUiState,
  }) {
    final offlineCourses = offlineCoursesUiState.dataOrNull ?? [];
    final offlineCourseMedias = offlineCourseMediasUiState.dataOrNull ?? [];
    final List<UiOfflineListItem> combinedItems = List.from(offlineCourses.map(
      (course) {
        return UiOfflineCourseItem(
          course: course,
        );
      },
    ))
      ..addAll(offlineCourseMedias.map(
        (media) {
          return UiOfflineCourseMediaItem(
            courseMedia: media,
          );
        },
      ));

    if (offlineCoursesUiState is UiStateEmpty &&
        offlineCourseMediasUiState is UiStateEmpty) {
      return const UiStateEmpty();
    } else if (offlineCourseMediasUiState.isSuccess &&
        offlineCoursesUiState.isSuccess) {
      return UiStateSuccess(
        combinedItems,
      );
    } else if (offlineCoursesUiState is UiStateInProgress ||
        offlineCourseMediasUiState is UiStateInProgress) {
      const UiStateInProgress();
    } else if (offlineCoursesUiState is UiStateFailure ||
        offlineCourseMediasUiState is UiStateFailure) {
      return UiStateFailure.fromException(
        Exception('Failed to load offline courses and medias'),
      );
    }
    return const UiStateInitial();
  }
}
