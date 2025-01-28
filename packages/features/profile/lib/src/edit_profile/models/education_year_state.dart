import 'package:domain/domain.dart';
import 'package:formz/formz.dart';
import 'package:ui/ui.dart';

class EducationYearState extends FormzInput<EducationYear?, FormFieldValidationError> {
  const EducationYearState.unvalidated([super.value]) : super.pure();

  const EducationYearState.validated([super.value]) : super.dirty();

  @override
  FormFieldValidationError? validator(EducationYear? value) {
    if (value == null) return const FormFieldValidationErrorEmpty();
    return null;
  }

  factory EducationYearState.newValue(EducationYearState oldState, EducationYear? newValue) {
    return oldState.shouldValidate
        ? EducationYearState.validated(
            newValue,
          )
        : EducationYearState.unvalidated(
            newValue,
          );
  }
}
