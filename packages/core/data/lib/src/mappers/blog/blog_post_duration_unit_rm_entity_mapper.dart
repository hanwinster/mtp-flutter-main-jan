import 'package:api/api.dart';
import 'package:database/database.dart';

extension BlogPostDurationUnitRMEntityMapper on BlogPostDurationUnitRM {
  BlogPostDurationUnitEntity toEntity() {
    switch (this) {
      case BlogPostDurationUnitRM.unknown:
        return BlogPostDurationUnitEntity.unknown;
      case BlogPostDurationUnitRM.minute:
        return BlogPostDurationUnitEntity.minute;
      case BlogPostDurationUnitRM.hour:
        return BlogPostDurationUnitEntity.hour;
      case BlogPostDurationUnitRM.day:
        return BlogPostDurationUnitEntity.day;
      case BlogPostDurationUnitRM.week:
        return BlogPostDurationUnitEntity.week;
      case BlogPostDurationUnitRM.month:
        return BlogPostDurationUnitEntity.month;
      case BlogPostDurationUnitRM.year:
        return BlogPostDurationUnitEntity.year;
      default:
        return BlogPostDurationUnitEntity.unknown;
    }
  }
}
