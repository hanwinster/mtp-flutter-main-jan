import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

import 'course_learner_status_rm.dart';

part 'course_learner_rm.g.dart';

@JsonSerializable(createToJson: false)
class CourseLearnerRM extends Equatable {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'course_id')
  final int? courseId;
  @JsonKey(name: 'user_id')
  final int? userId;
  @JsonKey(name: 'status', unknownEnumValue: CourseLearnerStatusRM.unknown)
  final CourseLearnerStatusRM? status;
  @JsonKey(name: 'percentage')
  final int? percentage;
  @JsonKey(name: 'notify_count')
  final int? notifyCount;
  @JsonKey(name: 'active')
  final int? active;
  @JsonKey(name: 'completed')
  final List<dynamic>? completed;
  @JsonKey(name: 'is_ready_to_evaluate')
  final bool? isReadyToEvaluate;
  @JsonKey(name: 'is_ready_to_generate_certificate')
  final bool? isReadyToGenerateCertificate;

  const CourseLearnerRM({
    this.id,
    this.courseId,
    this.userId,
    this.status,
    this.percentage,
    this.notifyCount,
    this.active,
    this.completed,
    this.isReadyToEvaluate,
    this.isReadyToGenerateCertificate,
  });

  @override
  List<Object?> get props =>
      [
        id,
        courseId,
        userId,
        status,
        percentage,
        notifyCount,
        active,
        completed,
        isReadyToEvaluate,
        isReadyToGenerateCertificate,
      ];

  factory CourseLearnerRM.fromJson(Map<String, dynamic> json) => _$CourseLearnerRMFromJson(json);

  CourseLearner toDomainModel() {
    return CourseLearner(
      id: id?.toString() ?? (throw Exception('id must not be null')),
      courseId: courseId?.toString() ?? '',
      status: status?.toDomainModel() ?? CourseLearnerStatus.unknown,
      percentage: percentage ?? 0,
      notifyCount: notifyCount ?? 0,
      completionStatus: _mapCompletionStatus(completed ?? []),
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