import 'package:domain/domain.dart';
import 'package:formz/formz.dart';
import 'package:ui/ui.dart';

class RegionState extends FormzInput<ContactRegion?, FormFieldValidationError> {
  const RegionState.unvalidated([super.value]) : super.pure();

  const RegionState.validated([super.value]) : super.dirty();

  @override
  FormFieldValidationError? validator(ContactRegion? value) {
    // region is optional
    return null;
  }

  factory RegionState.newValue(RegionState oldState, ContactRegion newValue) {
    return oldState.shouldValidate
        ? RegionState.validated(
            newValue,
          )
        : RegionState.unvalidated(
            newValue,
          );
  }
}
