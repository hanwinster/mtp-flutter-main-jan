import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help/src/contact_us/bloc/bloc.dart';
import 'package:ui/ui.dart';

class MessageInput extends StatefulWidget {
  const MessageInput({
    super.key,
    required this.focusNode,
    required this.onFieldSubmitted,
  });

  final FocusNode focusNode;
  final Function() onFieldSubmitted;

  @override
  State<MessageInput> createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
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
          previous.messageState != current.messageState,
      listener: (context, state) {
        _controller.text = state.messageState.value;
      },
      child: BlocBuilder<ContactUsBloc, ContactUsState>(
        buildWhen: (previous, current) =>
        previous.messageState != current.messageState ||
            previous.messageError != current.messageError,
        builder: (context, state) {
          return MtpOutlineTextField(
            controller: _controller,
            minLines: 3,
            maxLines: 5,
            labelText: context.l10n.contactUsLabelMessage,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => widget.onFieldSubmitted(),
            focusNode: widget.focusNode,
            onChanged: (value) {
              context.read<ContactUsBloc>().add(ContactUsMessageChanged(value));
            },
            errorText: state.messageError?.resolveErrorMessage(context),
          );
        },
      ),
    );
  }
}
