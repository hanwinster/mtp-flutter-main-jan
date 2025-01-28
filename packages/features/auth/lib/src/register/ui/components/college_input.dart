import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/register_bloc.dart';

class CollegeInput extends StatelessWidget {
  const CollegeInput({
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
          previous.collegeState != current.collegeState ||
          previous.collegeError != current.collegeError ||
          previous.collegesUiState != current.collegesUiState,
      builder: (context, state) {
        final selectedItem = state.collegeState.value != null
            ? CollegeDropdownItemState.fromDomain(state.collegeState.value!)
            : null;

        return MtpDropdown<CollegeDropdownItemState>(
          hintText: context.l10n.registerLabelCollege,
          selectedValue: selectedItem,
          items: state.collegesUiState.dataOrNull?.map((userType) =>
              CollegeDropdownItemState.fromDomain(userType))
                  .toList() ??
              [],
          errorText: state.collegeError?.resolveErrorMessage(context),
          onChanged: (value) {
            if (value == null) return;

            context
                .read<RegisterBloc>()
                .add(RegisterCollegeChanged(value.college));
          },
        );
      },
    );
  }
}
