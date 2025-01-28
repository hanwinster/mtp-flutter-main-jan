import 'package:api/api.dart';
import 'package:database/database.dart';

extension UserRoleCodeRMEntityMapper on UserRoleCodeRM {
  UserRoleCodeEntity toEntity() {
    switch (this) {
      case UserRoleCodeRM.admin:
        return UserRoleCodeEntity.admin;
      case UserRoleCodeRM.manager:
        return UserRoleCodeEntity.manager;
      case UserRoleCodeRM.teacherEducator:
        return UserRoleCodeEntity.teacherEducator;
      case UserRoleCodeRM.studentTeacher:
        return UserRoleCodeEntity.studentTeacher;
      case UserRoleCodeRM.journalist:
        return UserRoleCodeEntity.journalist;
      case UserRoleCodeRM.independentLearner:
        return UserRoleCodeEntity.independentLearner;
      case UserRoleCodeRM.independentTeacher:
        return UserRoleCodeEntity.independentTeacher;
      case UserRoleCodeRM.guest:
        return UserRoleCodeEntity.guest;
      default:
        return UserRoleCodeEntity.unknown;
    }
  }
}
