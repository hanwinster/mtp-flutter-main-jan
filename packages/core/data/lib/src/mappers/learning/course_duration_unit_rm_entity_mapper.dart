import 'package:api/api.dart';
import 'package:database/database.dart';

extension CourseDurationUnitRMEntityMapper on CourseDurationUnitRM {
  CourseDurationUnitEntity toEntity() {
    switch (this) {
      case CourseDurationUnitRM.second:
        return CourseDurationUnitEntity.second;
      case CourseDurationUnitRM.minute:
        return CourseDurationUnitEntity.minute;
      case CourseDurationUnitRM.hour:
        return CourseDurationUnitEntity.hour;
      case CourseDurationUnitRM.day:
        return CourseDurationUnitEntity.day;
      case CourseDurationUnitRM.week:
        return CourseDurationUnitEntity.week;
      case CourseDurationUnitRM.month:
        return CourseDurationUnitEntity.month;
      case CourseDurationUnitRM.year:
        return CourseDurationUnitEntity.year;
      default:
        return CourseDurationUnitEntity.unknown;
    }
  }
}
