import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/forgot_password_bloc.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({
    super.key,
    required this.focusNode,
    required this.onFieldSubmitted,
  });

  final FocusNode focusNode;
  final Function() onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
      buildWhen: (previous, current) =>
          previous.emailState != current.emailState ||
          previous.emailError != current.emailError,
      builder: (context, state) {
        return MtpOutlineTextField(
          helperText: context.l10n.registerLabelEmailHelper,
          labelText: context.l10n.registerLabelEmail,
          prefixIcon: const Icon(Icons.email_outlined),
          textInputAction: TextInputAction.go,
          keyboardType: TextInputType.emailAddress,
          onSubmitted: (_) => onFieldSubmitted(),
          inputFormatters: [
            emailTextInputFormatter,
          ],
          focusNode: focusNode,
          onChanged: (value) {
            context.read<ForgotPasswordBloc>().add(ForgotPasswordEmailChanged(value));
          },
          errorText: state.emailError?.resolveErrorMessage(context),
        );
      },
    );
  }
}
