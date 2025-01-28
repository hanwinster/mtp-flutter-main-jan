import 'package:base/base.dart';
import 'package:database/database.dart';
import 'package:domain/domain.dart';

class CourseLearnerEntity extends Equatable {
  final String id;
  final String courseId;
  final String userId;
  final CourseLearnerStatusEntity status;
  final int percentage;
  final int notifyCount;
  final bool isActive;
  final Map<String, bool> completionStatusByMaterialKey;
  final bool isReadyToEvaluate;
  final bool isReadyToGenerateCertificate;

  const CourseLearnerEntity({
    required this.id,
    required this.courseId,
    required this.userId,
    required this.status,
    required this.percentage,
    required this.notifyCount,
    required this.isActive,
    required this.completionStatusByMaterialKey,
    required this.isReadyToEvaluate,
    required this.isReadyToGenerateCertificate,
  });

  CourseLearner toDomainModel() {
    return CourseLearner(
      id: id.toString(),
      courseId: courseId,
      status: status.toDomainModel(),
      percentage: percentage,
      notifyCount: notifyCount,
      completionStatus: completionStatusByMaterialKey,
      isReadyToEvaluate: isReadyToEvaluate,
      isReadyToGenerateCertificate: isReadyToGenerateCertificate,
    );
  }

  @override
  List<Object> get props =>
      [
        id,
        courseId,
        userId,
        status,
        percentage,
        notifyCount,
        isActive,
        completionStatusByMaterialKey,
        isReadyToEvaluate,
        isReadyToGenerateCertificate,
      ];
}