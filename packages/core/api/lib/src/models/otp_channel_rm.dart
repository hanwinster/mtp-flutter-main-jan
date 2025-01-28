import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'otp_channel_rm.g.dart';

@JsonEnum(
  alwaysCreate: true,
)
enum OtpChannelRM {
  @JsonValue('email')
  email,
  @JsonValue('sms')
  sms,
  @JsonValue('unknown')
  unknown;

  factory OtpChannelRM.fromJson(String json) => decodeEnum(
        _$OtpChannelRMEnumMap,
        json,
        unknownValue: OtpChannelRM.unknown,
      );

  String toJson() => encodeEnum(
        _$OtpChannelRMEnumMap,
        this,
      );

  OtpChannel toDomainModel() {
    switch (this) {
      case OtpChannelRM.email:
        return OtpChannel.email;
      case OtpChannelRM.sms:
        return OtpChannel.sms;
      default:
        return OtpChannel.unknown;
    }
  }

  static OtpChannelRM fromDomainModel(OtpChannel otpChannel) {
    switch (otpChannel) {
      case OtpChannel.email:
        return OtpChannelRM.email;
      case OtpChannel.sms:
        return OtpChannelRM.sms;
      default:
        return OtpChannelRM.unknown;
    }
  }
}
