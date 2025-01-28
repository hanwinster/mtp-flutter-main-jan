import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/edit_profile_bloc.dart';

class EmailInput extends StatefulWidget {
  const EmailInput({
    super.key,
    required this.focusNode,
    required this.onFieldSubmitted,
  });

  final FocusNode focusNode;
  final Function() onFieldSubmitted;

  @override
  State<EmailInput> createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
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
      previous.emailState != current.emailState,
      listener: (context, state) {
        _controller.text = state.emailState.value;
      },
      buildWhen: (previous, current) =>
          previous.emailState != current.emailState ||
          previous.emailError != current.emailError,
      builder: (context, state) {
        return MtpOutlineTextField(
          controller: _controller,
          labelText: context.l10n.editProfileLabelEmail,
          prefixIcon: const Icon(Icons.email_outlined),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
          onSubmitted: (_) => widget.onFieldSubmitted(),
          inputFormatters: [
            emailTextInputFormatter,
          ],
          focusNode: widget.focusNode,
          onChanged: (value) {
            context.read<EditProfileBloc>().add(EditProfileEmailChanged(value));
          },
          errorText: state.emailError?.resolveErrorMessage(context),
        );
      },
    );
  }
}
