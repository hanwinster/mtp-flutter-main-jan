import 'package:domain/domain.dart';

import 'package:ui/ui.dart';

class EducationYearDropdownItemState extends DropdownItemState {
  const EducationYearDropdownItemState({
    required this.year,
    required String label,
  }) : super(itemLabel: label);

  final EducationYear year;

  factory EducationYearDropdownItemState.fromDomain(
      EducationYear college, String label) {
    return EducationYearDropdownItemState(
      year: college,
      label: label,
    );
  }
}
