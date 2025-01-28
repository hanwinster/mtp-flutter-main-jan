import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ui/ui.dart';

import '../bloc/bloc.dart';
import '../models/media_state.dart';
import 'components/components.dart';

class PostCommentReplyInput extends StatefulWidget {
  const PostCommentReplyInput({
    super.key,
    this.reply,
  });

  final ThematicGroupPostCommentReply? reply;

  @override
  State<PostCommentReplyInput> createState() => _PostCommentReplyInputState();
}

class _PostCommentReplyInputState extends State<PostCommentReplyInput> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(BuildContext context) async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null && context.mounted) {
      context.read<PostCommentReplyInputBloc>().add(
            PostCommentReplyInputMediaChanged((
              uri: Uri.file(pickedFile.path),
              type: PostCommentMediaType.image,
            )),
          );
    }
  }

  Future<void> _pickVideo(BuildContext context) async {
    final XFile? pickedFile =
        await _picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null && context.mounted) {
      context.read<PostCommentReplyInputBloc>().add(
            PostCommentReplyInputMediaChanged((
              uri: Uri.file(pickedFile.path),
              type: PostCommentMediaType.video,
            )),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<PostCommentReplyInputBloc, PostCommentReplyInputState>(
          listenWhen: (previous, current) {
            return previous.replyCreatingStatus !=
                current.replyCreatingStatus;
          },
          listener: (context, state) {
            if (state.replyCreatingStatus is UiStateSuccess) {
              Navigator.pop(context, state.replyCreatingStatus.dataOrNull);
            } else if (state.replyCreatingStatus is UiStateFailure) {
              showSnackBar(
                  context, state.replyCreatingStatus.messageOrEmpty(context));
            }
          },
        ),
        BlocListener<PostCommentReplyInputBloc, PostCommentReplyInputState>(
          listenWhen: (previous, current) {
            return previous.replyUpdatingStatus !=
                current.replyUpdatingStatus;
          },
          listener: (context, state) {
            if (state.replyUpdatingStatus is UiStateSuccess) {
              Navigator.pop(context, state.replyUpdatingStatus.dataOrNull);
            } else if (state.replyUpdatingStatus is UiStateFailure) {
              showSnackBar(
                  context, state.replyUpdatingStatus.messageOrEmpty(context));
            }
          },
        ),
      ],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const LoadingIndicator(),
          TextInput(
            initialText: widget.reply?.description ?? '',
          ),
          BlocBuilder<PostCommentReplyInputBloc, PostCommentReplyInputState>(
            buildWhen: (previous, current) =>
                previous.isInEditMode != current.isInEditMode,
            builder: (context, state) {
              if (state.isInEditMode) {
                return const SizedBox.shrink();
              }

              return Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MtpTextButton(
                    onPressed: () {
                      _pickImage(context);
                    },
                    icon: const Icon(Icons.add_a_photo),
                    label: Text(context.l10n.postLabelAddPhoto),
                  ),
                  const SizedBox(width: Grid.one),
                  MtpTextButton(
                    onPressed: () {
                      _pickVideo(context);
                    },
                    icon: const Icon(Icons.video_library),
                    label: Text(context.l10n.postLabelAddVideo),
                  ),
                ],
              );
            },
          ),
          const MediaPreview(),
          const SizedBox(height: Grid.two),
          const SubmitButton(),
        ],
      ),
    );
  }
}
