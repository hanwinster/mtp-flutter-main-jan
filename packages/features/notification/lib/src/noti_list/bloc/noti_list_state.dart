part of 'noti_list_bloc.dart';

class NotiListState extends Equatable {
  const NotiListState({
    this.notiListUiState = const UiStateInitial(),
    this.notis = const [],
    this.page = 1,
    this.hasReachedMax = false,
  });

  final UiState<NotificationListWithReadCount> notiListUiState;
  final List<NotificationItem> notis; // List of posts
  final int page; // Current page for pagination
  final bool hasReachedMax; // Flag to check if max has been reached

  factory NotiListState.create() {
    return const NotiListState();
  }

  @override
  List<Object?> get props => [
        notiListUiState,
        notis,
        page,
        hasReachedMax,
      ];

  NotiListState copyWith({
    UiState<NotificationListWithReadCount>? notificationsUiState,
    List<NotificationItem>? notis,
    int? page,
    bool? hasReachedMax,
  }) {
    return NotiListState(
      notiListUiState: notificationsUiState ?? this.notiListUiState,
      notis: notis ?? this.notis,
      page: page ?? this.page,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}
