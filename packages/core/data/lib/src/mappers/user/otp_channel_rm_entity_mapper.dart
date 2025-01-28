import 'package:api/api.dart';
import 'package:database/database.dart';

extension OtpChannelRMEntityMapper on OtpChannelRM {
  OtpChannelEntity toEntity() {
    switch (this) {
      case OtpChannelRM.email:
        return OtpChannelEntity.email;
      case OtpChannelRM.sms:
        return OtpChannelEntity.sms;
      default:
        return OtpChannelEntity.unknown;
    }
  }
}
