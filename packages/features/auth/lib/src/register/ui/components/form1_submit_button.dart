import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/register_bloc.dart';

class Form1SubmitButton extends StatelessWidget {
  const Form1SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MtpPrimaryButton(
        labelText: context.l10n.registerButtonTextNext,
        onPressed: () {
          hideKeyboard();
          context
              .read<RegisterBloc>()
              .add(const RegisterForm1Submitted());
        },
      ),
    );
  }
}
