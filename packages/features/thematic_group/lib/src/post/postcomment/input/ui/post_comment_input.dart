
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ui/ui.dart';

import '../models/media_state.dart';
import 'components/components.dart';
import '../bloc/bloc.dart';

class PostCommentInput extends StatefulWidget {

  final String type;
  const PostCommentInput({super.key,
  required this.type});

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
    return BlocListener<PostCommentInputBloc, PostCommentInputState>(
      listenWhen: (previous, current) {
        return previous.formSubmissionStatus != current.formSubmissionStatus;
      },
      listener: (context, state) {
        if (state.isFormSubmissionSuccess) {
          Navigator.pop(context);
          return;
        }

        if (state.isFormSubmissionFailure) {
          showSnackBar(context, state.formSubmissionStatus.messageOrEmpty(context));
          return;
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const LoadingIndicator(),
          const TextInput(),
          Row(
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
              widget.type == "post"? MtpTextButton(
                onPressed: () {
                  _pickVideo(context);
                },
                icon: const Icon(Icons.video_library),
                label: Text(context.l10n.postLabelAddVideo),
              ):const SizedBox(),
            ],
          ),
          const MediaPreview(),
          const SizedBox(height: Grid.two),
          const SubmitButton(),
        ],
      ),
    );
  }
}
