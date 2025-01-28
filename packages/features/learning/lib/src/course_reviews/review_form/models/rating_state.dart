import 'package:formz/formz.dart';
import 'package:ui/ui.dart';

class RatingState extends FormzInput<int, FormFieldValidationError> {
  const RatingState.unvalidated([super.value = 0]) : super.pure();

  const RatingState.validated([super.value = 0]) : super.dirty();

  @override
  FormFieldValidationError? validator(int value) {
    if (value == 0) return const FormFieldValidationErrorEmpty();
    return null;
  }

  factory RatingState.newValue(RatingState oldState, int newValue) {
    return oldState.shouldValidate
        ? RatingState.validated(
            newValue,
          )
        : RatingState.unvalidated(
            newValue,
          );
  }
}
