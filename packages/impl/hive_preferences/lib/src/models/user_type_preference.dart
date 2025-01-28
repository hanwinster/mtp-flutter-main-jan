import 'package:domain/domain.dart';
import 'package:hive/hive.dart';
import 'package:hive_preferences/src/hive_ids.dart';

part 'user_type_preference.g.dart';

@HiveType(typeId: HiveTypeId.userTypePreference)
enum UserTypePreference {
  @HiveField(0)
  independentLearner,
  @HiveField(1)
  journalist,
  @HiveField(2)
  studentTeacher,
  @HiveField(3)
  independentTeacher,
  @HiveField(4)
  unknown;

  factory UserTypePreference.fromDomainModel(UserType domainModel) {
    switch (domainModel) {
      case UserType.independentLearner:
        return UserTypePreference.independentLearner;
      case UserType.journalist:
        return UserTypePreference.journalist;
      case UserType.studentTeacher:
        return UserTypePreference.studentTeacher;
      case UserType.independentTeacher:
        return UserTypePreference.independentTeacher;
      default:
        return UserTypePreference.unknown;
    }
  }

  UserType toDomainModel() {
    switch (this) {
      case UserTypePreference.independentLearner:
        return UserType.independentLearner;
      case UserTypePreference.journalist:
        return UserType.journalist;
      case UserTypePreference.studentTeacher:
        return UserType.studentTeacher;
      case UserTypePreference.independentTeacher:
        return UserType.independentTeacher;
      default:
        return UserType.unknown;
    }
  }
}
