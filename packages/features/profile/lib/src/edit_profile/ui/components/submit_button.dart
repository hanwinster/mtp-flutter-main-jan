import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/edit_profile_bloc.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileBloc, EditProfileState>(
      buildWhen: (previous, current) =>
          previous.formSubmissionStatus != current.formSubmissionStatus,
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: MtpPrimaryButton(
            labelText: context.l10n.editProfileButtonTextSubmit,
            onPressed: state.isFormSubmissionInProgress
                ? null
                : () {
                    hideKeyboard();
                    context
                        .read<EditProfileBloc>()
                        .add(const EditProfileSubmitted());
                  },
          ),
        );
      },
    );
  }
}
