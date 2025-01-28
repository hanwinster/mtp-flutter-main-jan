import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/register_bloc.dart';

class EducationYearInput extends StatelessWidget {
  const EducationYearInput({
    super.key,
    required this.focusNode,
    required this.onFieldSubmitted,
  });

  final FocusNode focusNode;
  final Function() onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) =>
          previous.educationYearState != current.educationYearState ||
          previous.educationYearError != current.educationYearError ||
          previous.educationYearsUiState != current.educationYearsUiState,
      builder: (context, state) {
        final educationYear = state.educationYearState.value;
        final selectedItem = educationYear != null
            ? EducationYearDropdownItemState.fromDomain(educationYear, educationYear.title)
            : null;

        return MtpDropdown<EducationYearDropdownItemState>(
          hintText: context.l10n.registerLabelYearOfStudyingTraining,
          selectedValue: selectedItem,
          items: state.educationYearsUiState.dataOrNull?.map((educationYear) =>
              EducationYearDropdownItemState.fromDomain(educationYear, educationYear.title))
                  .toList() ??
              [],
          errorText: state.educationYearError?.resolveErrorMessage(context),
          onChanged: (value) {
            if (value == null) return;

            context
                .read<RegisterBloc>()
                .add(RegisterEducationYearChanged(value.year));
          },
        );
      },
    );
  }
}
