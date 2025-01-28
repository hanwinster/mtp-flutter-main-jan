import 'package:domain/src/models/noti/notification.dart';

class PaginatedList {
  final int currentPage;
  final List<NotificationItem> data;
  final int lastPage;

  const PaginatedList({
    required this.currentPage,
    required this.data,
    required this.lastPage,
  });

  @override
  List<Object> get props => [ currentPage, lastPage, data];

  bool get hasMorePages => currentPage < lastPage;
}
