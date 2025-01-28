import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

extension UiOtpChannelX on OtpChannel {
  String getLabel(BuildContext context) {
    switch (this) {
      case OtpChannel.sms:
        return context.l10n.otpChannelLabelSms;
      case OtpChannel.email:
        return context.l10n.otpChannelLabelEmail;
      default:
        return '';
    }
  }
}