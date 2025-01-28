import 'package:base/base.dart';
import 'package:domain/src/models/noti/noti.dart';

class NotificationListWithReadCount extends Equatable {
  final int total;
  final int unread;
  final PaginatedList paginatedNotiList;

  const NotificationListWithReadCount({
    required this.total,
    required this.unread,
    required this.paginatedNotiList,
  });

  @override
  List<Object> get props => [total, unread, paginatedNotiList];
}

