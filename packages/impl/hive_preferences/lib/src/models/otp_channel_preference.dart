import 'package:domain/domain.dart';
import 'package:hive/hive.dart';
import 'package:hive_preferences/src/hive_ids.dart';

part 'otp_channel_preference.g.dart';

@HiveType(typeId: HiveTypeId.otpChannelPreference)
enum OtpChannelPreference {
  @HiveField(0)
  email,
  @HiveField(1)
  sms,
  @HiveField(2)
  unknown;

  factory OtpChannelPreference.fromDomainModel(OtpChannel domainModel) {
    switch (domainModel) {
      case OtpChannel.email:
        return OtpChannelPreference.email;
      case OtpChannel.sms:
        return OtpChannelPreference.sms;
      default:
        return OtpChannelPreference.unknown;
    }
  }

  OtpChannel toDomainModel() {
    switch (this) {
      case OtpChannelPreference.email:
        return OtpChannel.email;
      case OtpChannelPreference.sms:
        return OtpChannel.sms;
      default:
        return OtpChannel.unknown;
    }
  }
}
