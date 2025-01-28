import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/bloc.dart';
import '../../bloc/post_comment_input_bloc.dart';

class TextInput extends StatefulWidget {
  const TextInput({
    super.key,
    this.initialText = '',
  });
  final String initialText;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    if (widget.initialText.isNotEmpty) {
      _controller.text = widget.initialText;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostCommentInputBloc, PostCommentInputState>(
      listenWhen: (previous, current) =>
          previous.textState != current.textState,
      listener: (context, state) {
        _controller.text = state.textState.value;
      },
      child: BlocBuilder<PostCommentInputBloc, PostCommentInputState>(
        buildWhen: (previous, current) =>
            previous.textState != current.textState ||
            previous.textError != current.textError,
        builder: (context, state) {
          return MtpTextField(
            controller: _controller,
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            errorText: state.textError?.resolveErrorMessage(context),
            onChanged: (value) {
              context
                  .read<PostCommentInputBloc>()
                  .add(PostCommentInputTextChanged(value));
            },
            decoration: InputDecoration(
              hintText: context.l10n.postLabelPlaceholderComment,
            ),
          );
        },
      ),
    );
  }
}
