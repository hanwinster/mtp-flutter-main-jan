import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help/src/contact_us/bloc/bloc.dart';
import 'package:ui/ui.dart';

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
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ContactUsBloc, ContactUsState>(
      listenWhen: (previous, current) =>
          previous.emailState != current.emailState,
      listener: (context, state) {
        _controller.text = state.emailState.value;
      },
      child: BlocBuilder<ContactUsBloc, ContactUsState>(
        buildWhen: (previous, current) =>
            previous.emailState != current.emailState ||
            previous.emailError != current.emailError,
        builder: (context, state) {
          return MtpOutlineTextField(
            controller: _controller,
            labelText: context.l10n.contactUsLabelEmail,
            textInputAction: TextInputAction.next,
            onSubmitted: (_) => widget.onFieldSubmitted(),
            focusNode: widget.focusNode,
            onChanged: (value) {
              context.read<ContactUsBloc>().add(ContactUsEmailChanged(value));
            },
            errorText: state.emailError?.resolveErrorMessage(context),
          );
        },
      ),
    );
  }
}
