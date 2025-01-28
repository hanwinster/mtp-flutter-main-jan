import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/edit_profile_bloc.dart';

class PhoneInput extends StatefulWidget {
  const PhoneInput({
    super.key,
    required this.focusNode,
    required this.onFieldSubmitted,
  });

  final FocusNode focusNode;
  final Function() onFieldSubmitted;

  @override
  State<PhoneInput> createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(
      text: context.read<EditProfileBloc>().state.phoneNumberState.value,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileBloc, EditProfileState>(
      listenWhen: (previous, current) =>
          previous.phoneCodeState != current.phoneCodeState ||
          previous.phoneNumberState != current.phoneNumberState,
      listener: (context, state) {
        _controller.text = state.phoneNumberState.value;
      },
      buildWhen: (previous, current) =>
          previous.phoneCodeState != current.phoneCodeState ||
          previous.phoneNumberState != current.phoneNumberState ||
          previous.phoneNumberError != current.phoneNumberError ||
          previous.phoneCodeError != current.phoneCodeError ||
          previous.userUiState != current.userUiState,
      builder: (context, state) {
        return MtpOutlinePhoneField(
          controller: _controller,
          labelText: context.l10n.editProfileLabelPhone,
          textInputAction: TextInputAction.next,
          onSubmitted: (_) => widget.onFieldSubmitted(),
          focusNode: widget.focusNode,
          initialCountryCode:
              getCountryCodeFromDialCode(state.phoneCodeState.value),
          onNumberChanged: (value) {
            context
                .read<EditProfileBloc>()
                .add(EditProfilePhoneNumberChanged(value));
          },
          onCountryCodeChanged: (value) {
            context
                .read<EditProfileBloc>()
                .add(EditProfilePhoneCodeChanged(value));
            widget.focusNode.requestFocus();
          },
          errorText: state.phoneNumberError?.resolveErrorMessage(context) ??
              state.phoneCodeError?.resolveErrorMessage(context),
        );
      },
    );
  }
}
