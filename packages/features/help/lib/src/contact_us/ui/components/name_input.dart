import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help/src/contact_us/bloc/bloc.dart';
import 'package:ui/ui.dart';

class NameInput extends StatefulWidget {
  const NameInput({
    super.key,
    required this.focusNode,
    required this.onFieldSubmitted,
  });

  final FocusNode focusNode;
  final Function() onFieldSubmitted;

  @override
  State<NameInput> createState() => _NameInputState();
}

class _NameInputState extends State<NameInput> {
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
          previous.nameState != current.nameState,
      listener: (context, state) {
        _controller.text = state.nameState.value;
      },
      child: BlocBuilder<ContactUsBloc, ContactUsState>(
        buildWhen: (previous, current) =>
        previous.nameState != current.nameState ||
            previous.nameError != current.nameError,
        builder: (context, state) {
          return MtpOutlineTextField(
            controller: _controller,
            labelText: context.l10n.contactUsLabelName,
            textInputAction: TextInputAction.next,
            onSubmitted: (_) => widget.onFieldSubmitted(),
            focusNode: widget.focusNode,
            onChanged: (value) {
              context.read<ContactUsBloc>().add(ContactUsNameChanged(value));
            },
            errorText: state.nameError?.resolveErrorMessage(context),
          );
        },
      ),
    );
  }
}
