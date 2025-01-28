import 'package:json_annotation/json_annotation.dart';

enum OtpChannel {
  @JsonValue('email')
  email,
  @JsonValue('sms')
  sms,
  @JsonValue('unknown')
  unknown;

  factory OtpChannel.fromJson(String value) {
    switch (value) {
      case 'email':
        return OtpChannel.email;
      case 'sms':
        return OtpChannel.sms;
      default:
        return OtpChannel.unknown;
    }
  }

  String toJson() {
    switch (this) {
      case OtpChannel.email:
        return 'email';
      case OtpChannel.sms:
        return 'sms';
      default:
        return 'unknown';
    }
  }
}