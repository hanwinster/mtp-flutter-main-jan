import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/register_bloc.dart';

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
    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) =>
          previous.emailState != current.emailState ||
          previous.emailError != current.emailError,
      builder: (context, state) {
        return MtpOutlineTextField(
          labelText: context.l10n.registerLabelEmail,
          prefixIcon: const Icon(Icons.email_outlined),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
          onSubmitted: (_) => onFieldSubmitted(),
          inputFormatters: [
            emailTextInputFormatter,
          ],
          focusNode: focusNode,
          onChanged: (value) {
            context.read<RegisterBloc>().add(RegisterEmailChanged(value));
          },
          errorText: state.emailError?.resolveErrorMessage(context),
        );
      },
    );
  }
}
