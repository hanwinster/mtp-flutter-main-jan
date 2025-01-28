import 'package:database/database.dart';
import 'package:drift_database/drift_database.dart';

extension CourseLearnerEntryEntityMapper on CourseLearnerEntry {
  CourseLearnerEntity toEntity() {
    return CourseLearnerEntity(
      id: id,
      courseId: courseId,
      userId: userId,
      status: status,
      percentage: percentage ?? 0,
      notifyCount: notifyCount,
      isActive: isActive,
      completionStatusByMaterialKey: completionStatusByMaterialKey,
      isReadyToEvaluate: isReadyToEvaluate,
      isReadyToGenerateCertificate: isReadyToGenerateCertificate,
    );
  }
}
