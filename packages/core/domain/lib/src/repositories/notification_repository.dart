import 'package:domain/domain.dart';

abstract class NotificationRepository{
  Future<NotificationListWithReadCount> getNotificationListWithReadCount();
  Future<NotificationDetailResponse> getNotificationDetailResponse({required String notiId});
}