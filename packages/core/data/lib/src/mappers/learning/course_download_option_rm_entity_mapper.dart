import 'package:api/api.dart';
import 'package:database/database.dart';

extension CourseDownloadOptionRmEntityMapper on CourseDownloadableOptionRM {
  CourseDownloadableOptionEntity toEntity() {
    switch (this) {
      case CourseDownloadableOptionRM.afterEnrolling:
        return CourseDownloadableOptionEntity.afterEnrolling;
      case CourseDownloadableOptionRM.afterCompletion:
        return CourseDownloadableOptionEntity.afterCompletion;
      default:
        return CourseDownloadableOptionEntity.unknown;
    }
  }
}
