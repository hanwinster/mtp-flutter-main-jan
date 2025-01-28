import 'package:domain/domain.dart';
import 'package:hive/hive.dart';
import 'package:hive_preferences/src/hive_ids.dart';

part 'user_role_code_preference.g.dart';

@HiveType(typeId: HiveTypeId.userRoleCodePreference)
enum UserRoleCodePreference {
  @HiveField(0)
  admin,
  @HiveField(1)
  manager,
  @HiveField(2)
  teacherEducator,
  @HiveField(3)
  studentTeacher,
  @HiveField(4)
  journalist,
  @HiveField(5)
  independentLearner,
  @HiveField(6)
  independentTeacher,
  @HiveField(7)
  guest,
  @HiveField(8)
  unknown;

  factory UserRoleCodePreference.fromDomainModel(UserRoleCode domainModel) {
    switch (domainModel) {
      case UserRoleCode.admin:
        return UserRoleCodePreference.admin;
      case UserRoleCode.manager:
        return UserRoleCodePreference.manager;
      case UserRoleCode.teacherEducator:
        return UserRoleCodePreference.teacherEducator;
      case UserRoleCode.studentTeacher:
        return UserRoleCodePreference.studentTeacher;
      case UserRoleCode.journalist:
        return UserRoleCodePreference.journalist;
      case UserRoleCode.independentLearner:
        return UserRoleCodePreference.independentLearner;
      case UserRoleCode.independentTeacher:
        return UserRoleCodePreference.independentTeacher;
      case UserRoleCode.guest:
        return UserRoleCodePreference.guest;
      default:
        return UserRoleCodePreference.unknown;
    }
  }

  UserRoleCode toDomainModel() {
    switch (this) {
      case UserRoleCodePreference.admin:
        return UserRoleCode.admin;
      case UserRoleCodePreference.manager:
        return UserRoleCode.manager;
      case UserRoleCodePreference.teacherEducator:
        return UserRoleCode.teacherEducator;
      case UserRoleCodePreference.studentTeacher:
        return UserRoleCode.studentTeacher;
      case UserRoleCodePreference.journalist:
        return UserRoleCode.journalist;
      case UserRoleCodePreference.independentLearner:
        return UserRoleCode.independentLearner;
      case UserRoleCodePreference.independentTeacher:
        return UserRoleCode.independentTeacher;
      case UserRoleCodePreference.guest:
        return UserRoleCode.guest;
      default:
        return UserRoleCode.unknown;
    }
  }
}
