part of 'noti_list_bloc.dart';

sealed class NotiListEvent extends Equatable {
  const NotiListEvent();
}

class NotiListFetched extends NotiListEvent {
  final int? page;
  final int? pageSize;

  const NotiListFetched({this.pageSize, this.page});

  @override
  List<Object?> get props => [pageSize, page];
}
