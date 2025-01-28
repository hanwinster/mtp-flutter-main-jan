import '../../bloc/post_comment_input_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/bloc.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCommentInputBloc, PostCommentInputState>(
      buildWhen: (previous, current) =>
          previous.textState != current.textState ||
          previous.textError != current.textError,
      builder: (context, state) {
        return MtpTextField(
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
    );
  }
}
