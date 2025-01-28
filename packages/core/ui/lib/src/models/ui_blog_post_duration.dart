import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

extension UiPostDuration on BlogPostDuration {
  String asString(BuildContext context) {
    switch (unit) {
      case BlogPostDurationUnit.minute:
        return context.l10n.postLabelDurationUnitMinute(duration);
      case BlogPostDurationUnit.hour:
        return context.l10n.postLabelDurationUnitHour(duration);
      case BlogPostDurationUnit.day:
        return context.l10n.postLabelDurationUnitDay(duration);
      case BlogPostDurationUnit.week:
        return context.l10n.postLabelDurationUnitWeek(duration);
      case BlogPostDurationUnit.month:
        return context.l10n.postLabelDurationUnitMonth(duration);
      case BlogPostDurationUnit.year:
        return context.l10n.postLabelDurationUnitYear(duration);
      default:
        return '';
    }
  }
}
