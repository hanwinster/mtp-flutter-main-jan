import 'package:api/api.dart';
import 'package:data/src/mappers/mappers.dart';
import 'package:database/database.dart';

extension AssessmentUserAnswerRMEntityMapper on AssessmentUserAnswerRM {
  List<String> _mapUserAnswers(List<dynamic>? answers) {
    if (answers is List) {
      return answers.map((e) => e.toString()).toList();
    } else {
      return [];
    }
  }

  double _mapOverallScore(dynamic overallScore) {
    if (overallScore is double) {
      return overallScore;
    } else if (overallScore is int) {
      return overallScore.toDouble();
    } else if (overallScore is String) {
      return double.tryParse(overallScore) ?? 0;
    } else {
      return 0;
    }
  }

  AssessmentUserAnswerEntity toEntity() {
    return AssessmentUserAnswerEntity(
      id: id?.toString() ?? '',
      assessmentQuestionId: assessmentQuestionId?.toString() ?? '',
      courseId: courseId?.toString() ?? '',
      userId: userId?.toString() ?? '',
      answers: _mapUserAnswers(answers),
      score: score ?? 0,
      attempts: attempts ?? 0,
      status: status ?? '',
      overallScore: _mapOverallScore(overallScore),
      comment: comment ?? '',
      commentBy: null, // No need to use at the moment
      passOption: passOption?.toEntity() ?? AssessmentUserAnswerPassOptionEntity.unknown,
      attachFile: attachFile ?? '',
      createdAt: createdAt ?? DateTime.now(),
      updatedAt: updatedAt,
    );
  }
}
