import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'otp_channel_entity.g.dart';

@JsonEnum(
  alwaysCreate: true,
)
enum OtpChannelEntity {
  @JsonValue('email')
  email,
  @JsonValue('sms')
  sms,
  @JsonValue('unknown')
  unknown;

  factory OtpChannelEntity.fromJson(String json) => decodeEnum(
        _$OtpChannelEntityEnumMap,
        json,
        unknownValue: OtpChannelEntity.unknown,
      );

  String toJson() => encodeEnum(
        _$OtpChannelEntityEnumMap,
        this,
      );

  OtpChannel toDomainModel() {
    switch (this) {
      case OtpChannelEntity.email:
        return OtpChannel.email;
      case OtpChannelEntity.sms:
        return OtpChannel.sms;
      default:
        return OtpChannel.unknown;
    }
  }
}
