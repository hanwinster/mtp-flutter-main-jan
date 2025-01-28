part of 'noti_detail_bloc.dart';

sealed class NotiDetailEvent extends Equatable {
  const NotiDetailEvent();
}

class NotiDetailFetched extends NotiDetailEvent {
  const NotiDetailFetched(
      this.notiId,
      );

  final String notiId;

  @override
  List<Object> get props => [notiId];
}