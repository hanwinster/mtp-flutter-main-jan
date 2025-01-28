import 'package:api/api.dart';
import 'package:database/database.dart';


extension LearningQuizAssignmentRMEntityMapper on LearningQuizAssignmentRM {
  LearningQuizAssignmentEntity toEntity() {
    return LearningQuizAssignmentEntity(
      id: id?.toString() ?? (throw Exception("id must not be null")),
    );
  }
}
