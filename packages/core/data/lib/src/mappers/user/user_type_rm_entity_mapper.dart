import 'package:api/api.dart';
import 'package:database/database.dart';

extension UserTypeRMEntityMapper on UserTypeRM {
  UserTypeEntity toEntity() {
    switch (this) {
      case UserTypeRM.independentLearner:
        return UserTypeEntity.independentLearner;
      case UserTypeRM.journalist:
        return UserTypeEntity.journalist;
      case UserTypeRM.studentTeacher:
        return UserTypeEntity.studentTeacher;
      case UserTypeRM.independentTeacher:
        return UserTypeEntity.independentTeacher;
      default:
        return UserTypeEntity.unknown;
    }
  }
}
