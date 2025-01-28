import 'package:domain/domain.dart';

import 'package:ui/ui.dart';

class CollegeDropdownItemState extends DropdownItemState {
  CollegeDropdownItemState({
    required this.college,
  }) : super(itemLabel: college.name);

  final College college;

  factory CollegeDropdownItemState.fromDomain(College college) {
    return CollegeDropdownItemState(college: college);
  }
}
