import 'package:base/base.dart';
import 'package:domain/domain.dart';

class GetNotificationsUseCase {
  GetNotificationsUseCase({
    NotificationRepository? notificationRepository,
  }) : _notificationRepository = notificationRepository ?? getIt();

  final NotificationRepository _notificationRepository;

  Future<NotificationListWithReadCount> call() {
    return _notificationRepository.getNotificationListWithReadCount();
  }
}
