import 'package:base/base.dart';
import 'package:domain/domain.dart';

class GetNotificationsDetailUseCase {
  GetNotificationsDetailUseCase({
    NotificationRepository? notificationRepository,
  }) : _notificationRepository = notificationRepository ?? getIt();

  final NotificationRepository _notificationRepository;

  Future<NotificationDetailResponse> call({required String notiId}) {
    return _notificationRepository.getNotificationDetailResponse(notiId:notiId);
  }
}
