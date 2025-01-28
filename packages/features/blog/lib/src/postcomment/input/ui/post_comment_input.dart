import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ui/ui.dart';

import '../bloc/bloc.dart';
import '../models/media_state.dart';
import 'components/components.dart';

class PostCommentInput extends StatefulWidget {
  const PostCommentInput({
    super.key,
    this.comment,
  });

  final BlogPostComment? comment;

  @override
  State<PostCommentInput> createState() => _PostCommentInputState();
}

class _PostCommentInputState extends State<PostCommentInput> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(BuildContext context) async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null && context.mounted) {
      context.read<PostCommentInputBloc>().add(
            PostCommentInputMediaChanged((
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
      context.read<PostCommentInputBloc>().add(
            PostCommentInputMediaChanged((
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
        BlocListener<PostCommentInputBloc, PostCommentInputState>(
          listenWhen: (previous, current) {
            return previous.commentCreatingStatus !=
                current.commentCreatingStatus;
          },
          listener: (context, state) {
            if (state.commentCreatingStatus is UiStateSuccess) {
              Navigator.pop(context);
            } else if (state.commentCreatingStatus is UiStateFailure) {
              showSnackBar(
                  context, state.commentCreatingStatus.messageOrEmpty(context));
            }
          },
        ),
        BlocListener<PostCommentInputBloc, PostCommentInputState>(
          listenWhen: (previous, current) {
            return previous.commentUpdatingStatus !=
                current.commentUpdatingStatus;
          },
          listener: (context, state) {
            if (state.commentUpdatingStatus is UiStateSuccess) {
              Navigator.pop(context);
            } else if (state.commentUpdatingStatus is UiStateFailure) {
              showSnackBar(
                  context, state.commentUpdatingStatus.messageOrEmpty(context));
            }
          },
        ),
      ],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const LoadingIndicator(),
          TextInput(
            initialText: widget.comment?.text ?? '',
          ),
          BlocBuilder<PostCommentInputBloc, PostCommentInputState>(
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
