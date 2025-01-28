import 'package:api/api.dart';
import 'package:database/database.dart';
import 'course_learner_status_rm_entity_mapper.dart';

extension CourseLearnerRMEntityMapper on CourseLearnerRM {
  CourseLearnerEntity toEntity() {
    return CourseLearnerEntity(
      id: id?.toString() ?? (throw Exception('id must not be null')),
      courseId: courseId?.toString() ?? '',
      userId: userId?.toString() ?? '',
      isActive: active == 1,
      status: status?.toEntity() ?? CourseLearnerStatusEntity.unknown,
      percentage: percentage ?? 0,
      notifyCount: notifyCount ?? 0,
      completionStatusByMaterialKey: _mapCompletionStatus(completed ?? []),
      isReadyToEvaluate: isReadyToEvaluate ?? false,
      isReadyToGenerateCertificate: isReadyToGenerateCertificate ?? false,
    );
  }

  Map<String, bool> _mapCompletionStatus(List<dynamic> completed) {
    final map = <String, bool>{};
    for (final item in completed) {
      if (item is Map) {
        final key = item.keys.firstOrNull ?? '';
        final value = item.values.firstOrNull ?? 0;
        if (key.isNotEmpty) {
          map[key] = value == 1;
        }
      }
    }
    return map;
  }
}
