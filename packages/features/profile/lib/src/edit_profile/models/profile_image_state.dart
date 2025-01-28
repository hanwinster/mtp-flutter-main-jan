import 'package:formz/formz.dart';
import 'package:ui/ui.dart';

class ProfileImageState extends FormzInput<Uri?, FormFieldValidationError> {
  const ProfileImageState.unvalidated([super.value]) : super.pure();

  const ProfileImageState.validated([super.value]) : super.dirty();

  @override
  FormFieldValidationError? validator(Uri? value) {
    // profile picture is optional
    return null;
  }

  factory ProfileImageState.newValue(ProfileImageState oldState, Uri? newValue) {
    return oldState.shouldValidate
        ? ProfileImageState.validated(
            newValue,
          )
        : ProfileImageState.unvalidated(
            newValue,
          );
  }
}
