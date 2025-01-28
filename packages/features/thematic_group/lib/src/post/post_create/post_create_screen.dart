import 'dart:io';
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:ui/ui.dart';

import 'bloc/post_create_bloc.dart';

class PostCreateScreen extends StatefulWidget {
  final String groupId;

  const PostCreateScreen({
    super.key,
    required this.groupId,
  });

  @override
  State<PostCreateScreen> createState() => _PostCreateScreenState();
}

class _PostCreateScreenState extends State<PostCreateScreen> {
  final TextEditingController _descriptionController = TextEditingController();
  File? _pickedImage;
  File? _pickedVideo;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _pickedImage = File(image.path);
      });
    }
  }

  Future<void> _pickVideo() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.video);

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _pickedVideo = File(result.xFiles.first.path);
      });
    }
  }

  void _createPost() {
    final description = _descriptionController.text;
    if (description.isNotEmpty) {
      context.read<PostCreateBloc>().add(PostCreateSubmitted(
            groupId: widget.groupId,
            description: description,
            uploadedFile: _pickedImage,
            uploadedVideo: _pickedVideo,
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.groupLabelCreatePost),
        elevation: 1,
        titleSpacing: 0,
        scrolledUnderElevation: 0,
      ),
      body: BlocListener<PostCreateBloc, PostCreateState>(
        listenWhen: (previous, current) =>
            previous.postSubmissionUiState != current.postSubmissionUiState,
        listener: (context, state) {
          if (state.postSubmissionUiState is UiStateSuccess) {
            GroupPendingPostData pendingPostData = GroupPendingPostData(
                user: state.userUiState.dataOrNull!,
                createdAt: DateTime.now(),
                imageUrl: _pickedImage,
                uploadedVideoUrl: _pickedVideo,
                description: _descriptionController.text);
            Navigator.of(context).pop(pendingPostData);
          } else if (state.postSubmissionUiState is UiStateFailure) {
            showSnackBar(
                context, state.postSubmissionUiState.messageOrEmpty(context));
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Grid.two,
            vertical: Grid.two,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: BlocBuilder<PostCreateBloc, PostCreateState>(
                      builder: (context, state) {
                        return state.userUiState.toView(
                          context,
                          successViewBuilder: (user) {
                            return _AccountView(
                              user: user,
                              avatarSize: 52,
                            );
                          },
                        );
                      },
                    ),
                  ),
                  _SubmitButton(
                    onPressed: _createPost,
                  ),
                ],
              ),
              TextField(
                controller: _descriptionController,
                maxLines: 10,
                minLines: 5,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: context.l10n.groupLabelNewPostHint,
                ),
              ),
              const SizedBox(height: 10),
              if (_pickedImage != null && _pickedImage!.path.isNotEmpty) ...[
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(Grid.two),
                      child: AspectRatio(
                        aspectRatio: defaultImageAspectRatio,
                        child: MtpImage.uri(Uri.file(_pickedImage!.path)),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: _MediaRemoveButton(
                        onPressed: () {
                          setState(() {
                            _pickedImage = null;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
              if (_pickedVideo != null && _pickedVideo!.path.isNotEmpty) ...[
                Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: defaultImageAspectRatio,
                      child: MtpVideoPlayer(videoUrl: _pickedVideo!.path),
                    ),
                    Positioned.fill(
                      right: 8,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: _MediaRemoveButton(
                          onPressed: () {
                            setState(() {
                              _pickedVideo = null;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                )
              ],
              const Spacer(),
              _BottomMediaInputBar(
                onPickImage: _pickImage,
                onPickVideo: _pickVideo,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MediaRemoveButton extends StatelessWidget {
  const _MediaRemoveButton({required this.onPressed});

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      color: context.colorScheme.onPrimary,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: const Icon(Icons.close),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({
    required this.onPressed,
  });

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCreateBloc, PostCreateState>(
      buildWhen: (previous, current) =>
          previous.postSubmissionUiState != current.postSubmissionUiState,
      builder: (context, state) {
        final isInProgress = state.postSubmissionUiState is UiStateInProgress;
        return SizedBox(
          width: 100,
          child: MtpPrimarySubmitButton(
            isInProgress: isInProgress,
            labelText: context.l10n.groupButtonTextSubmitPost,
            onPressed: onPressed,
          ),
        );
      },
    );
  }
}

class _BottomMediaInputBar extends StatelessWidget {
  const _BottomMediaInputBar({
    required this.onPickImage,
    required this.onPickVideo,
  });

  final Function() onPickImage;
  final Function() onPickVideo;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: context.colorScheme.outlineVariant),
        borderRadius: BorderRadius.circular(Grid.one),
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: onPickImage,
              child: _MediaInputButton(
                icon: Icons.image_outlined,
                text: context.l10n.groupLabelPhoto,
                // onPressed: onPickImage,
              ),
            ),
          ),
          Container(
            width: 1,
            height: 36,
            color: context.colorScheme.outlineVariant,
          ),
          Expanded(
            child: InkWell(
              onTap: onPickVideo,
              child: Center(
                child: _MediaInputButton(
                  icon: Icons.video_camera_back_outlined,
                  text: context.l10n.groupLabelVideo,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MediaInputButton extends StatelessWidget {
  const _MediaInputButton({
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 24),
          const SizedBox(width: Grid.one),
          Text(
            text,
            style: context.textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}

class _AccountView extends StatelessWidget {
  const _AccountView({
    required this.user,
    this.avatarSize = 52,
  });

  final User? user;
  final double avatarSize;

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return const SizedBox.shrink();
    }

    return Row(
      children: [
        MtpCircleImage(
          user?.avatar ?? '',
          width: avatarSize,
          height: avatarSize,
        ),
        const SizedBox(width: Grid.one),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user?.fullName ?? '',
              style: context.textTheme.titleMedium,
            ),
            const SizedBox(height: 3),
            Text(
              "Group Members",
              style: context.textTheme.labelMedium,
            ),
          ],
        ),
      ],
    );
  }
}
