import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_role_code_entity.g.dart';

@JsonEnum(alwaysCreate: true)
enum UserRoleCodeEntity {
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

  factory UserRoleCodeEntity.fromJson(String value) => decodeEnum(
        _$UserRoleCodeEntityEnumMap,
        value,
        unknownValue: UserRoleCodeEntity.unknown,
      );

  String toJson() => encodeEnum(_$UserRoleCodeEntityEnumMap, this);

  UserRoleCode toDomainModel() {
    switch (this) {
      case UserRoleCodeEntity.admin:
        return UserRoleCode.admin;
      case UserRoleCodeEntity.manager:
        return UserRoleCode.manager;
      case UserRoleCodeEntity.teacherEducator:
        return UserRoleCode.teacherEducator;
      case UserRoleCodeEntity.studentTeacher:
        return UserRoleCode.studentTeacher;
      case UserRoleCodeEntity.journalist:
        return UserRoleCode.journalist;
      case UserRoleCodeEntity.independentLearner:
        return UserRoleCode.independentLearner;
      case UserRoleCodeEntity.independentTeacher:
        return UserRoleCode.independentTeacher;
      case UserRoleCodeEntity.guest:
        return UserRoleCode.guest;
      default:
        return UserRoleCode.unknown;
    }
  }
}
