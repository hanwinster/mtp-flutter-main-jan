import 'package:domain/domain.dart';

enum UserType {
  independentLearner,
  journalist,
  studentTeacher,
  independentTeacher,
  unknown;

  AccountType get accountType {
    switch (this) {
      case UserType.independentLearner:
        return AccountType.learner;
      case UserType.journalist:
        return AccountType.learner;
      case UserType.studentTeacher:
        return AccountType.learner;
      case UserType.independentTeacher:
        return AccountType.teacher;
      default:
        return AccountType.unknown;
    }
  }
}