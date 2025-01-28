import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../json/converters/converters.dart';
import 'notification_rm.dart';  // Assuming NotificationRM is defined in this file

part 'notification_detail_rm.g.dart';

@JsonSerializable(createToJson: false)
class NotificationDetailResponseRM {

  @JsonKey(name:'message')
  final String message;
  @JsonKey(name:'data')
  final NotificationDetailRM data;

  const NotificationDetailResponseRM({
    required this.message,
    required this.data,
  });

  factory NotificationDetailResponseRM.fromJson(Map<String, dynamic> json) =>
      _$NotificationDetailResponseRMFromJson(json);

  NotificationDetailResponse toDomainModel() => NotificationDetailResponse(
    message: message,
    data: data.toDomainModel(),
  );
}

@JsonSerializable(createToJson: false)
@DateTimeStringConverter()
class NotificationDetailRM {
  @JsonKey(name: "id")
  final String? id;  // ID is now a string as per the new data
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
  @JsonKey(name: "data")
  final NotificationDataRM? notificationData;

  const NotificationDetailRM({
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

  factory NotificationDetailRM.fromJson(Map<String, dynamic> json) =>
      _$NotificationDetailRMFromJson(json);
}