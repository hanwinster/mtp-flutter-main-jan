import 'package:api/api.dart';
import 'package:database/database.dart';

extension CourseLearnerStatusRMEntityMapper on CourseLearnerStatusRM {
  CourseLearnerStatusEntity toEntity() {
    switch (this) {
      case CourseLearnerStatusRM.notStarted:
        return CourseLearnerStatusEntity.notStarted;
      case CourseLearnerStatusRM.learning:
        return CourseLearnerStatusEntity.learning;
      case CourseLearnerStatusRM.completed:
        return CourseLearnerStatusEntity.completed;
      default:
        return CourseLearnerStatusEntity.unknown;
    }
  }
}
