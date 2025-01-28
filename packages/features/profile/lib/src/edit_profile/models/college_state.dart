import 'package:domain/domain.dart';
import 'package:formz/formz.dart';
import 'package:ui/ui.dart';

class CollegeState extends FormzInput<College?, FormFieldValidationError> {
  const CollegeState.unvalidated([super.value]) : super.pure();

  const CollegeState.validated([super.value]) : super.dirty();

  @override
  FormFieldValidationError? validator(College? value) {
    if (value == null) return const FormFieldValidationErrorEmpty();
    return null;
  }

  factory CollegeState.newValue(CollegeState oldState, College? newValue) {
    return oldState.shouldValidate
        ? CollegeState.validated(
            newValue,
          )
        : CollegeState.unvalidated(
            newValue,
          );
  }
}
