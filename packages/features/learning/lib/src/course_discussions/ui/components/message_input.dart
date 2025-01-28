import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';
import '../../bloc/bloc.dart';

class MessageInput extends StatefulWidget {
  const MessageInput({
    super.key,
  });

  @override
  State<MessageInput> createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CourseDiscussionsBloc, CourseDiscussionsState>(
          listenWhen: (previous, current) =>
          previous.messageState != current.messageState,
          listener: (context, state) {
            _textEditingController.text = state.messageState.value;
          },
        ),
      ],
      child: BlocBuilder<CourseDiscussionsBloc, CourseDiscussionsState>(
        buildWhen: (previous, current) =>
            previous.messageState != current.messageState ||
            previous.messageError != current.messageError,
        builder: (context, state) {
          return MtpOutlineTextField(
            controller: _textEditingController,
            maxLines: 3,
            minLines: 1,
            textInputAction: TextInputAction.send,
            onSubmitted: (_) {
              hideKeyboard();
              context.read<CourseDiscussionsBloc>().add(
                    const CourseDiscussionMessageSubmitted(),
                  );
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: context.l10n.courseDiscussionLabelInputHint,
            ),
            onChanged: (value) {
              context
                  .read<CourseDiscussionsBloc>()
                  .add(CourseDiscussionMessageChanged(value));
            },
          );
        },
      ),
    );
  }
}
