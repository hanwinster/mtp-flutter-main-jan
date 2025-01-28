import 'package:domain/domain.dart';
import 'package:formz/formz.dart';
import 'package:ui/ui.dart';

class UserTypeState extends FormzInput<UserType, FormFieldValidationError> {
  const UserTypeState.unvalidated([super.value = UserType.independentLearner]) : super.pure();

  const UserTypeState.validated([super.value = UserType.independentLearner]) : super.dirty();

  @override
  FormFieldValidationError? validator(UserType value) {
    return null;
  }

  factory UserTypeState.newValue(UserTypeState oldState, UserType newValue) {
    return oldState.shouldValidate
        ? UserTypeState.validated(
            newValue,
          )
        : UserTypeState.unvalidated(
            newValue,
          );
  }
}
