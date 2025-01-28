import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_type_rm.g.dart';

@JsonEnum(alwaysCreate: true)
enum UserTypeRM {
  @JsonValue('independent_learner')
  independentLearner,
  @JsonValue('journalist')
  journalist,
  @JsonValue('student_teacher')
  studentTeacher,
  @JsonValue('independent_teacher')
  independentTeacher,
  @JsonValue('unknown')
  unknown;

  factory UserTypeRM.fromJson(String value) => decodeEnum(
        _$UserTypeRMEnumMap,
        value,
        unknownValue: UserTypeRM.unknown,
      );

  String toJson() => encodeEnum(_$UserTypeRMEnumMap, this);

  factory UserTypeRM.fromDomainModel(UserType domainModel) {
    switch (domainModel) {
      case UserType.independentLearner:
        return UserTypeRM.independentLearner;
      case UserType.journalist:
        return UserTypeRM.journalist;
      case UserType.studentTeacher:
        return UserTypeRM.studentTeacher;
      case UserType.independentTeacher:
        return UserTypeRM.independentTeacher;
      default:
        return UserTypeRM.unknown;
    }
  }

  UserType toDomainModel() {
    switch (this) {
      case UserTypeRM.independentLearner:
        return UserType.independentLearner;
      case UserTypeRM.journalist:
        return UserType.journalist;
      case UserTypeRM.studentTeacher:
        return UserType.studentTeacher;
      case UserTypeRM.independentTeacher:
        return UserType.independentTeacher;
      default:
        return UserType.unknown;
    }
  }
}
