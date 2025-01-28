import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:domain/src/models/learning/course_material_completion.dart';

class CourseLearner extends Equatable {
  final String id;
  final String courseId;
  final CourseLearnerStatus status;
  final int percentage;
  final int notifyCount;
  final Map<String, bool> completionStatus;
  final bool isReadyToEvaluate;
  final bool isReadyToGenerateCertificate;

  const CourseLearner({
    required this.id,
    required this.courseId,
    required this.status,
    required this.percentage,
    required this.notifyCount,
    required this.completionStatus,
    required this.isReadyToEvaluate,
    required this.isReadyToGenerateCertificate,
  });

  @override
  List<Object> get props => [
        id,
        courseId,
        status,
        percentage,
        notifyCount,
        completionStatus,
        isReadyToEvaluate,
        isReadyToGenerateCertificate,
      ];

  bool get hasAssessment =>
      completionStatus.keys.any((key) => key.startsWith('assessment'));

  bool get hasCompletedCourse => status == CourseLearnerStatus.completed;

  bool get isReadyForAssessment => completionStatus.keys
      .whereNot((key) => key.startsWith('assessment'))
      .every((key) => completionStatus[key] == true);

  bool get hasCompletedAllAssessments => completionStatus.keys
      .where((key) => key.startsWith('assessment'))
      .every((key) => completionStatus[key] == true);

  bool get hasCompletedAllMaterials =>
      completionStatus.values.every((value) => value == true);

  List<String> get _orderKeys => completionStatus.keys.toList();

  bool hasNextMaterial(String currentMaterialKey) {
    final orderKeys = _orderKeys;
    final currentIndex = orderKeys.indexOf(currentMaterialKey);
    return currentIndex != -1 && currentIndex < orderKeys.length - 1;
  }

  bool hasPreviousMaterial(String currentMaterialKey) {
    final orderKeys = _orderKeys;
    final currentIndex = orderKeys.indexOf(currentMaterialKey);
    return currentIndex != -1 && currentIndex > 0;
  }

  CourseMaterialCompletion findMaterial(String materialKey) {
    return CourseMaterialCompletion(
      key: materialKey,
      isCompleted: completionStatus[materialKey] ?? false,
    );
  }

  CourseMaterial? get xApiMaterial {
    final xApiMaterialStatus =
        completionStatus.entries.firstWhereOrNull((entry) {
      final prefix = entry.key.split('_').first;
      return CourseMaterialType.xapi.prefixes.contains(prefix);
    });
    if (xApiMaterialStatus != null) {
      return findMaterial(xApiMaterialStatus.key).toCourseMaterial();
    }
    return null;
  }

  CourseMaterialCompletion? getNextMaterial({
    required String currentMaterialKey,
  }) {
    int currentIndex = -1;
    final orderKeys = _orderKeys;
    for (var i = 0; i < orderKeys.length; i++) {
      final key = orderKeys[i];

      if (key == currentMaterialKey) {
        currentIndex = i;
        break;
      }
    }

    if (currentIndex == -1) {
      return null;
    }

    if (hasNextMaterial(currentMaterialKey)) {
      final nextMaterialKey = orderKeys[currentIndex + 1];
      return CourseMaterialCompletion(
        key: nextMaterialKey,
        isCompleted: completionStatus[nextMaterialKey] ?? false,
      );
    }
    return null;
  }

  CourseMaterialCompletion? getPreviousMaterial({
    required String currentMaterialKey,
  }) {
    int currentIndex = -1;
    final orderKeys = _orderKeys;
    for (var i = 0; i < orderKeys.length; i++) {
      final key = orderKeys[i];

      if (key == currentMaterialKey) {
        currentIndex = i;
        break;
      }
    }

    if (currentIndex == -1) {
      return null;
    }

    if (hasPreviousMaterial(currentMaterialKey)) {
      final previousMaterialKey = orderKeys[currentIndex - 1];
      return CourseMaterialCompletion(
        key: previousMaterialKey,
        isCompleted: completionStatus[previousMaterialKey] ?? false,
      );
    }
    return null;
  }
}
