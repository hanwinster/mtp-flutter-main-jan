import 'package:api/api.dart';
import 'package:database/database.dart';

extension CourseMaterialTypeRMEntityMapper on CourseMaterialTypeRM {
  CourseMaterialTypeEntity toEntity() {
    switch (this) {
      case CourseMaterialTypeRM.intro:
        return CourseMaterialTypeEntity.intro;
      case CourseMaterialTypeRM.lecture:
        return CourseMaterialTypeEntity.lecture;
      case CourseMaterialTypeRM.learningActivity:
      case CourseMaterialTypeRM.learning:
        return CourseMaterialTypeEntity.learningActivity;
      case CourseMaterialTypeRM.quiz:
        return CourseMaterialTypeEntity.quiz;
      case CourseMaterialTypeRM.summary:
        return CourseMaterialTypeEntity.summary;
      case CourseMaterialTypeRM.liveSession:
        return CourseMaterialTypeEntity.liveSession;
      case CourseMaterialTypeRM.assessment:
        return CourseMaterialTypeEntity.assessment;
      case CourseMaterialTypeRM.evaluation:
        return CourseMaterialTypeEntity.evaluation;
      default:
        return CourseMaterialTypeEntity.unknown;
    }
  }
}
