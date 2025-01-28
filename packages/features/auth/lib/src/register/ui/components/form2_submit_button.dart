import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/register_bloc.dart';

class Form2SubmitButton extends StatelessWidget {
  const Form2SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) =>
          previous.formSubmissionStatus != current.formSubmissionStatus,
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: MtpPrimaryButton(
            labelText: context.l10n.registerButtonTextRegister,
            onPressed: state.isFormSubmissionInProgress
                ? null
                : () {
                    hideKeyboard();
                    context
                        .read<RegisterBloc>()
                        .add(const RegisterForm2Submitted());
                  },
          ),
        );
      },
    );
  }
}
