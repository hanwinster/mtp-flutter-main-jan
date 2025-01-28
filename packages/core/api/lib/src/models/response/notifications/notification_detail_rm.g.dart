// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_detail_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationDetailResponseRM _$NotificationDetailResponseRMFromJson(
        Map<String, dynamic> json) =>
    NotificationDetailResponseRM(
      message: json['message'] as String,
      data: NotificationDetailRM.fromJson(json['data'] as Map<String, dynamic>),
    );

NotificationDetailRM _$NotificationDetailRMFromJson(
        Map<String, dynamic> json) =>
    NotificationDetailRM(
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
      notificationData: json['data'] == null
          ? null
          : NotificationDataRM.fromJson(json['data'] as Map<String, dynamic>),
    );
