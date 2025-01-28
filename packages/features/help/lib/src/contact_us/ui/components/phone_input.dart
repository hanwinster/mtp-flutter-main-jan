import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help/src/contact_us/bloc/bloc.dart';
import 'package:ui/ui.dart';

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
          previous.phoneState != current.phoneState,
      listener: (context, state) {
        _controller.text = state.phoneState.value;
      },
      child: BlocBuilder<ContactUsBloc, ContactUsState>(
        buildWhen: (previous, current) =>
            previous.phoneState != current.phoneState ||
            previous.phoneError != current.phoneError,
        builder: (context, state) {
          return MtpOutlineTextField(
            controller: _controller,
            labelText: context.l10n.contactUsLabelPhoneNumber,
            textInputAction: TextInputAction.next,
            onSubmitted: (_) => widget.onFieldSubmitted(),
            focusNode: widget.focusNode,
            onChanged: (value) {
              context.read<ContactUsBloc>().add(ContactUsPhoneChanged(value));
            },
            errorText: state.phoneError?.resolveErrorMessage(context),
          );
        },
      ),
    );
  }
}
