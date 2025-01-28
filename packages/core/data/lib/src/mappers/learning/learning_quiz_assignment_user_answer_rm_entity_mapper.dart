import 'package:api/api.dart';
import 'package:database/database.dart';

extension LearningQuizAssignmentUserAnswerRMEntityMapper
    on LearningQuizAssignmentUserAnswerRM {
  LearningQuizAssignmentUserAnswerEntity toEntity() {
    return LearningQuizAssignmentUserAnswerEntity(
      id: id?.toString() ?? (throw Exception("id must not be null")),
      assignmentId: assignmentId?.toString() ?? '',
      userId: userId?.toString() ?? '',
      attachedFileUrl: assignmentAttachedFile ?? '',
      score: score ?? 0,
      comment: comment ?? '',
      commentBy: null,
      createdAt: createdAt ?? DateTime.now(),
      updatedAt: updatedAt,
    );
  }
}
