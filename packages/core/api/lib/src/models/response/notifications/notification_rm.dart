import 'package:api/src/json/converters/converters.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_rm.g.dart';

@JsonSerializable(createToJson: false)
class NotificationListResponse {
  @JsonKey(name: 'total')
  final int? total;

  @JsonKey(name: 'unread')
  final int? unread;

  @JsonKey(name: 'notifications')
  final NotificationPagination? pagination;

  const NotificationListResponse({
    this.total,
    this.unread,
    this.pagination,
  });

  // Convert to domain model
  NotificationListWithReadCount toDomainModel() =>
      NotificationListWithReadCount(
        total: total ?? 0,
        unread: unread ?? 0,
        paginatedNotiList: pagination!.toDomainModel(),
      );

  factory NotificationListResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationListResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class NotificationPagination {
  @JsonKey(name: 'current_page')
  final int? currentPage;

  @JsonKey(name: 'data')
  final List<NotificationRM>? data;

  @JsonKey(name: 'last_page')
  final int? lastPage;

  const NotificationPagination({
    this.currentPage,
    this.data,
    this.lastPage,
  });

  // Convert to domain model
  PaginatedList toDomainModel() {
    return PaginatedList(
      currentPage: currentPage ?? 1,
      data: data?.map((item) => item.toDomainModel()).toList()
              as List<NotificationItem> ??
          [],
      lastPage: lastPage ?? 1,
    );
  }

  factory NotificationPagination.fromJson(Map<String, dynamic> json) =>
      _$NotificationPaginationFromJson(json);
}

@JsonSerializable(createToJson: false)
@DateTimeStringConverter()
class NotificationRM {
  @JsonKey(name: "id")
  final String? id; // ID is now a string as per the new data
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "model")
  final String? model;
  @JsonKey(name: "model_id")
  final int? modelId;
  @JsonKey(name: "notifiable_type")
  final String? notifiableType;
  @JsonKey(name: "notifiable_id")
  final int? notifiableId;
  @JsonKey(name: "read_at")
  final DateTime? readAt;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @JsonKey(name: "notification_data")
  final NotificationDataRM? notificationData;

  const NotificationRM({
    this.id,
    this.type,
    this.model,
    this.modelId,
    this.notifiableType,
    this.notifiableId,
    this.readAt,
    this.createdAt,
    this.updatedAt,
    this.notificationData,
  });

  NotificationItem toDomainModel() => NotificationItem(
        id: id ?? (throw Exception("id must not be null")),
        type: type ?? '',
        notifiableType: notifiableType ?? '',
        notifiableId: notifiableId?.toString() ?? '',
        readAt: readAt,
        createdAt: createdAt ?? DateTime.now(),
        updatedAt: updatedAt ?? DateTime.now(),
        notificationData: notificationData?.toDomainModel() ??
            (throw Exception("Notification data must not be null")),
      );

  factory NotificationRM.fromJson(Map<String, dynamic> json) =>
      _$NotificationRMFromJson(json);
}

@JsonSerializable(createToJson: false)
class NotificationDataRM {
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "body")
  final String? body;
  @JsonKey(name: "click_action_link")
  final String? clickActionLink;
  @JsonKey(name: "click_action_page")
  final String? clickActionPage;
  @JsonKey(name: "app_link")
  final String? clickAppLink;
  @JsonKey(name: "model_id")
  final int? modelId;
  @JsonKey(name: "line")
  final String? line;
  @JsonKey(name: "icon_image_url")
  final String? iconImage;
  @JsonKey(name: "big_picture_url")
  final String? bigImage;

  const NotificationDataRM(
      {this.title,
      this.body,
      this.clickActionLink,
      this.clickActionPage,
      this.clickAppLink,
      this.modelId,
      this.line,
      this.iconImage,
      this.bigImage});

  NotificationData toDomainModel() => NotificationData(
      title: title ?? '',
      body: body ?? '',
      clickActionLink: clickActionLink ?? '',
      clickActionPage: clickActionPage ?? '',
      clickAppLink: clickAppLink ?? '',
      line: line ?? '',
      iconImage: iconImage ?? '',
      bigImage: bigImage ?? '');

  factory NotificationDataRM.fromJson(Map<String, dynamic> json) =>
      _$NotificationDataRMFromJson(json);
}
