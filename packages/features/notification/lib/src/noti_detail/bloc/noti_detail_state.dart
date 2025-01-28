part of 'noti_detail_bloc.dart';

final class NotiDetailState extends Equatable {
  const NotiDetailState({
    required this.notiId,
    this.notiUIstate = const UiStateInitial(),
  });

  final String notiId;
  final UiState<NotificationItem> notiUIstate;

  factory NotiDetailState.create({
    required String notiId,
  }) {
    return NotiDetailState(
      notiId: notiId,
    );
  }

  @override
  List<Object> get props => [
    notiId,
    notiUIstate,
  ];

  NotiDetailState copyWith({
    String? notiId,
    UiState<NotificationItem>? notiUIstate,
  }) {
    return NotiDetailState(
      notiId: notiId ?? this.notiId,
      notiUIstate: notiUIstate ?? this.notiUIstate,
    );
  }
}
