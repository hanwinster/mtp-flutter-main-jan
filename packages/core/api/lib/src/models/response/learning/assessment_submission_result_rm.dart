import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'assessment_submission_result_rm.g.dart';

@JsonSerializable(createToJson: false)
class AssessmentSubmissionResultRM extends Equatable {
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'score')
  final num? score;
  @JsonKey(name: 'pass')
  final bool? isPass;
  @JsonKey(name: 'acceptable_score')
  final num? acceptableScore;
  @JsonKey(name: 'proceed_message')
  final String? proceedMessage;

  const AssessmentSubmissionResultRM({
    this.message,
    this.score,
    this.isPass,
    this.acceptableScore,
    this.proceedMessage,
  });

  @override
  List<Object?> get props => [
        message,
        score,
        isPass,
        acceptableScore,
        proceedMessage,
      ];

  factory AssessmentSubmissionResultRM.fromJson(Map<String, dynamic> json) => _$AssessmentSubmissionResultRMFromJson(json);

  AssessmentSubmissionResult toDomainModel() {
    return AssessmentSubmissionResult(
      message: message ?? '',
      score: score?.toDouble() ?? 0.0,
      isPass: isPass ?? false,
      acceptableScore: acceptableScore?.toDouble() ?? 0.0,
      proceedMessage: proceedMessage ?? '',
    );
  }
}
