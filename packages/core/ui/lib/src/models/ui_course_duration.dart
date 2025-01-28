import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

extension UiCourseDuration on CourseDuration {
  String asString(BuildContext context) {
    switch (unit) {
      case CourseDurationUnit.minute:
        return context.l10n.durationUnitMinute(duration);
      case CourseDurationUnit.hour:
        return context.l10n.durationUnitHour(duration);
      case CourseDurationUnit.day:
        return context.l10n.durationUnitDay(duration);
      case CourseDurationUnit.week:
        return context.l10n.durationUnitWeek(duration);
      case CourseDurationUnit.month:
        return context.l10n.durationUnitMonth(duration);
      case CourseDurationUnit.year:
        return context.l10n.durationUnitYear(duration);
      default:
        return '';
    }
  }
}
