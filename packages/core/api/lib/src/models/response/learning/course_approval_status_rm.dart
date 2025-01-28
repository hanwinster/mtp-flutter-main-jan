import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course_approval_status_rm.g.dart';

@JsonEnum(
  alwaysCreate: true,
)
enum CourseApprovalStatusRM {
  @JsonValue('pending')
  pending,
  @JsonValue('approved')
  approved,
  @JsonValue('rejected')
  rejected,
  @JsonValue('unknown')
  unknown;


  factory CourseApprovalStatusRM.fromJson(String value) => decodeEnum(
    _$CourseApprovalStatusRMEnumMap,
    value,
    unknownValue: CourseApprovalStatusRM.unknown,
  );

  String toJson() => encodeEnum(_$CourseApprovalStatusRMEnumMap, this);

  CourseApprovalStatus toDomainModel() {
    switch (this) {
      case CourseApprovalStatusRM.pending:
        return CourseApprovalStatus.pending;
      case CourseApprovalStatusRM.approved:
        return CourseApprovalStatus.approved;
      case CourseApprovalStatusRM.rejected:
        return CourseApprovalStatus.rejected;
      default:
        return CourseApprovalStatus.unknown;
    }
  }
}