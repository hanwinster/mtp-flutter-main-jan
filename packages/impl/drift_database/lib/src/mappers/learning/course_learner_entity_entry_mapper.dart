import 'package:database/database.dart';
import 'package:drift/drift.dart';
import 'package:drift_database/drift_database.dart';

extension CourseLearnerEntityEntryMapper on CourseLearnerEntity {
  CourseLearnerEntry toEntry() {
    return CourseLearnerEntry(
      id: id,
      courseId: courseId,
      userId: userId,
      status: status,
      percentage: percentage,
      notifyCount: notifyCount,
      isActive: isActive,
      completionStatusByMaterialKey: completionStatusByMaterialKey,
      isReadyToEvaluate: isReadyToEvaluate,
      isReadyToGenerateCertificate: isReadyToGenerateCertificate,
      createdAt: DateTime.now(),
      updatedAt: null,
      deletedAt: null,
    );
  }

  CourseLearnerTableCompanion toCompanion() {
    return CourseLearnerTableCompanion.insert(
      id: id,
      courseId: courseId,
      userId: userId,
      status: status,
      percentage: Value(percentage),
      notifyCount: notifyCount,
      isActive: isActive,
      completionStatusByMaterialKey: completionStatusByMaterialKey,
      isReadyToEvaluate: isReadyToEvaluate,
      isReadyToGenerateCertificate: isReadyToGenerateCertificate,
      createdAt: DateTime.now(),
      updatedAt: const Value(null),
      deletedAt: const Value(null),
    );
  }
}
