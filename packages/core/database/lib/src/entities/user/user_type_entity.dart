import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_type_entity.g.dart';

@JsonEnum(alwaysCreate: true)
enum UserTypeEntity {
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

  factory UserTypeEntity.fromJson(String value) => decodeEnum(
        _$UserTypeEntityEnumMap,
        value,
        unknownValue: UserTypeEntity.unknown,
      );

  String toJson() => encodeEnum(_$UserTypeEntityEnumMap, this);

  factory UserTypeEntity.fromDomainModel(UserType domainModel) {
    switch (domainModel) {
      case UserType.independentLearner:
        return UserTypeEntity.independentLearner;
      case UserType.journalist:
        return UserTypeEntity.journalist;
      case UserType.studentTeacher:
        return UserTypeEntity.studentTeacher;
      case UserType.independentTeacher:
        return UserTypeEntity.independentTeacher;
      default:
        return UserTypeEntity.unknown;
    }
  }

  UserType toDomainModel() {
    switch (this) {
      case UserTypeEntity.independentLearner:
        return UserType.independentLearner;
      case UserTypeEntity.journalist:
        return UserType.journalist;
      case UserTypeEntity.studentTeacher:
        return UserType.studentTeacher;
      case UserTypeEntity.independentTeacher:
        return UserType.independentTeacher;
      default:
        return UserType.unknown;
    }
  }
}
