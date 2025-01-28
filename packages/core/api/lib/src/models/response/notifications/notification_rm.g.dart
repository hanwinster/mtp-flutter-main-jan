// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationListResponse _$NotificationListResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationListResponse(
      total: (json['total'] as num?)?.toInt(),
      unread: (json['unread'] as num?)?.toInt(),
      pagination: json['notifications'] == null
          ? null
          : NotificationPagination.fromJson(
              json['notifications'] as Map<String, dynamic>),
    );

NotificationPagination _$NotificationPaginationFromJson(
        Map<String, dynamic> json) =>
    NotificationPagination(
      currentPage: (json['current_page'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => NotificationRM.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastPage: (json['last_page'] as num?)?.toInt(),
    );

NotificationRM _$NotificationRMFromJson(Map<String, dynamic> json) =>
    NotificationRM(
      id: json['id'] as String?,
      type: json['type'] as String?,
      model: json['model'] as String?,
      modelId: (json['model_id'] as num?)?.toInt(),
      notifiableType: json['notifiable_type'] as String?,
      notifiableId: (json['notifiable_id'] as num?)?.toInt(),
      readAt:
          const DateTimeStringConverter().fromJson(json['read_at'] as String?),
      createdAt: const DateTimeStringConverter()
          .fromJson(json['created_at'] as String?),
      updatedAt: const DateTimeStringConverter()
          .fromJson(json['updated_at'] as String?),
      notificationData: json['notification_data'] == null
          ? null
          : NotificationDataRM.fromJson(
              json['notification_data'] as Map<String, dynamic>),
    );

NotificationDataRM _$NotificationDataRMFromJson(Map<String, dynamic> json) =>
    NotificationDataRM(
      title: json['title'] as String?,
      body: json['body'] as String?,
      clickActionLink: json['click_action_link'] as String?,
      clickActionPage: json['click_action_page'] as String?,
      clickAppLink: json['app_link'] as String?,
      modelId: (json['model_id'] as num?)?.toInt(),
      line: json['line'] as String?,
      iconImage: json['icon_image_url'] as String?,
      bigImage: json['big_picture_url'] as String?,
    );
