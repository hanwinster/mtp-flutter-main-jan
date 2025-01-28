import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_role_code_rm.g.dart';

@JsonEnum(alwaysCreate: true)
enum UserRoleCodeRM {
  @JsonValue('admin')
  admin,
  @JsonValue('manager')
  manager,
  @JsonValue('teacher_educator')
  teacherEducator,
  @JsonValue('student_teacher')
  studentTeacher,
  @JsonValue('journalist')
  journalist,
  @JsonValue('independent_learner')
  independentLearner,
  @JsonValue('independent_teacher')
  independentTeacher,
  @JsonValue('guest')
  guest,
  @JsonValue('unknown')
  unknown;

  factory UserRoleCodeRM.fromJson(String value) => decodeEnum(
        _$UserRoleCodeRMEnumMap,
        value,
        unknownValue: UserRoleCodeRM.unknown,
      );

  String toJson() => encodeEnum(_$UserRoleCodeRMEnumMap, this);

  factory UserRoleCodeRM.fromDomainModel(UserRoleCode domainModel) {
    switch (domainModel) {
      case UserRoleCode.admin:
        return UserRoleCodeRM.admin;
      case UserRoleCode.manager:
        return UserRoleCodeRM.manager;
      case UserRoleCode.teacherEducator:
        return UserRoleCodeRM.teacherEducator;
      case UserRoleCode.studentTeacher:
        return UserRoleCodeRM.studentTeacher;
      case UserRoleCode.journalist:
        return UserRoleCodeRM.journalist;
      case UserRoleCode.independentLearner:
        return UserRoleCodeRM.independentLearner;
      case UserRoleCode.independentTeacher:
        return UserRoleCodeRM.independentTeacher;
      case UserRoleCode.guest:
        return UserRoleCodeRM.guest;
      default:
        return UserRoleCodeRM.unknown;
    }
  }

  UserRoleCode toDomainModel() {
    switch (this) {
      case UserRoleCodeRM.admin:
        return UserRoleCode.admin;
      case UserRoleCodeRM.manager:
        return UserRoleCode.manager;
      case UserRoleCodeRM.teacherEducator:
        return UserRoleCode.teacherEducator;
      case UserRoleCodeRM.studentTeacher:
        return UserRoleCode.studentTeacher;
      case UserRoleCodeRM.journalist:
        return UserRoleCode.journalist;
      case UserRoleCodeRM.independentLearner:
        return UserRoleCode.independentLearner;
      case UserRoleCodeRM.independentTeacher:
        return UserRoleCode.independentTeacher;
      case UserRoleCodeRM.guest:
        return UserRoleCode.guest;
      default:
        return UserRoleCode.unknown;
    }
  }
}
