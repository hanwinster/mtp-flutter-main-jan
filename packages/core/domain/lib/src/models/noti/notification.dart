import 'package:base/base.dart';

class NotificationItem extends Equatable {
  final String id;

  final String type;

  final String notifiableType;

  final String notifiableId;

  final DateTime? readAt;

  final DateTime createdAt;

  final DateTime updatedAt;

  final NotificationData notificationData;

  const NotificationItem({
    required this.id,
    required this.type,
    required this.notifiableType,
    required this.notifiableId,
    required this.readAt,
    required this.createdAt,
    required this.updatedAt,
    required this.notificationData,
  });

  @override
  List<Object?> get props => [
        id,
        type,
        notifiableType,
        notifiableId,
        readAt,
        createdAt,
        updatedAt,
        notificationData,
      ];
}

class NotificationData extends Equatable {
  final String title;

  final String body;

  final String clickActionLink;

  final String clickActionPage;

  final String clickAppLink;

  final String line;

  final String iconImage;

  final String bigImage;

  const NotificationData(
      {required this.title,
      required this.body,
      required this.clickActionLink,
      required this.clickActionPage,
      required this.clickAppLink,
      required this.line,
      required this.iconImage,
      required this.bigImage});

  @override
  List<Object> get props => [
        title,
        body,
        clickActionLink,
        clickActionPage,
        clickAppLink,
        line,
        iconImage,
        bigImage
      ];
}
