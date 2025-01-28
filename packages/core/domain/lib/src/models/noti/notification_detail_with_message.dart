import '../../../domain.dart';

class NotificationDetailResponse {
  final String message;
  final NotificationItem data;

  NotificationDetailResponse({
    required this.message,
    required this.data,
  });
}
