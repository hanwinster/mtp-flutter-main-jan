import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/register_bloc.dart';

class PhoneInput extends StatelessWidget {
  const PhoneInput({
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
          previous.phoneCodeState != current.phoneCodeState ||
          previous.phoneNumberState != current.phoneNumberState ||
          previous.phoneNumberError != current.phoneNumberError ||
          previous.phoneCodeError != current.phoneCodeError,
      builder: (context, state) {
        return MtpOutlinePhoneField(
          hintText:  context.l10n.registerLabelPhone,
          helperText: context.l10n.registerLabelPhoneHelper,
          textInputAction: TextInputAction.next,
          onSubmitted: (_) => onFieldSubmitted(),
          focusNode: focusNode,
          initialCountryCode: state.phoneCodeState.value,
          onNumberChanged: (value) {
            context.read<RegisterBloc>().add(RegisterPhoneNumberChanged(value));
          },
          onCountryCodeChanged: (value) {
            context.read<RegisterBloc>().add(RegisterPhoneCodeChanged(value));
            focusNode.requestFocus();
          },
          errorText: state.phoneNumberError?.resolveErrorMessage(context) ??
              state.phoneCodeError?.resolveErrorMessage(context),
        );
      },
    );
  }
}
