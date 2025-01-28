import 'dart:io';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:ui/ui.dart';

import '../../../../thematic_group.dart';
import '../../../common/common.dart';
import '../bloc/post_edit_bloc.dart';

class PostEditScreen extends StatefulWidget {
  final OnPostEdited onPostCreated;
  final String groupId;
  final String postId;
  final ThematicGroupPost post;

  const PostEditScreen(
      {super.key,
      required this.postId,
      required this.groupId,
      required this.onPostCreated,
      required this.post});

  @override
  State<PostEditScreen> createState() => _PostEditScreenState();
}

class _PostEditScreenState extends State<PostEditScreen> {
  final TextEditingController _descriptionController = TextEditingController();
  File? _pickedImage;
  File? _pickedVideo;

  // Variables to store initial values for comparison
  late String _initialDescription;
  String? _initialImagePath;
  String? _initialVideoPath;

  @override
  void initState() {
    super.initState();

    // Pre-populate the description and store the initial value
    _descriptionController.text = widget.post.description ?? '';
    _initialDescription = _descriptionController.text;

    // Pre-populate and store the initial image path if the post has any image
    if (widget.post.imageUrl != null) {
      _pickedImage = File(widget.post.imageUrl!);
      _initialImagePath = widget.post.imageUrl!;
    }

    // Pre-populate and store the initial video path if the post has any video
    if (widget.post.uploadedVideoUrl != null) {
      _pickedVideo = File(widget.post.uploadedVideoUrl!);
      _initialVideoPath = widget.post.uploadedVideoUrl!;
    }
  }

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

  bool _hasDataChanged() {
    // Check if the description has changed
    bool descriptionChanged =
        _descriptionController.text != _initialDescription;

    // Check if the image has changed
    bool imageChanged = (_pickedImage?.path != _initialImagePath);

    // Check if the video has changed
    bool videoChanged = (_pickedVideo?.path != _initialVideoPath);

    // Return true if any of the fields have changed
    return descriptionChanged || imageChanged || videoChanged;
  }

  void _editPost() {
    // Check if any data has changed before proceeding
    if (!_hasDataChanged()) {
      // If no changes were made, show a message or skip the submission
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.groupToastNoChanges)),
      );
      return;
    }

    // If changes were made, proceed with dispatching the event
    final description = _descriptionController.text;
    if (description.isNotEmpty) {
      context.read<PostEditBloc>().add(EditPostEvent(
            post_id: widget.postId,
            group_id: widget.groupId,
            description: description,
            uploadedFile: _pickedImage,
            uploadedVideo: _pickedVideo,
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostEditBloc, PostEditState>(
      listenWhen: (previous, current) {
        return previous.postUiState != current.postUiState;
      },
      listener: (context, state) {
        if (state.postUiState is UiStateSuccess) {
          final post = state.postUiState.dataOrNull;
          if (post == null) return;
          setState(() {
            _descriptionController.text = post.description ?? '';
            _initialDescription = _descriptionController.text;

            if (post.imageUrl != null) {
              _pickedImage = File(post.imageUrl!);
              _initialImagePath = post.imageUrl ?? '';
            }

            if (post.uploadedVideoUrl != null) {
              _pickedVideo = File(post.uploadedVideoUrl!);
              _initialVideoPath = post.uploadedVideoUrl!;
            }
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.groupLabelEditPost),
          elevation: 1,
          titleSpacing: 0,
          scrolledUnderElevation: 0,
        ),
        body: BlocListener<PostEditBloc, PostEditState>(
          listener: (context, state) {
            if (state.formSubmissionUiState is UiStateSuccess) {
              var successMessage = context.l10n.groupLabelSuccessEditPost;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(successMessage)),
              );
              GroupPendingPostData pendingPostData = GroupPendingPostData(
                  user: state.userUiState.dataOrNull!,
                  createdAt: DateTime.now(),
                  imageUrl: _pickedImage,
                  uploadedVideoUrl: _pickedVideo,
                  description: _descriptionController.text);

              widget.onPostCreated(pendingPostData);
            } else if (state.formSubmissionUiState is UiStateFailure) {
              var errorMessage = context.l10n.groupLabelFailEditPost;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(errorMessage)),
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                        flex: 4,
                        child: BlocBuilder<PostEditBloc, PostEditState>(
                            builder: (context, state) {
                          return state.userUiState.toView(context,
                              successViewBuilder: (user) {
                            return AccountView(
                              name: user?.fullName,
                              image: user?.avatar,
                            );
                          }, emptyViewBuilder: (message) {
                            return Text(message);
                          }, errorViewBuilder: (error) {
                            return Text(error.message);
                          }, loadingViewBuilder: (data) {
                            return const CircularProgressIndicator();
                          });
                        })),
                    BlocBuilder<PostEditBloc, PostEditState>(
                      builder: (context, state) {
                        final isInProgress =
                            state.formSubmissionUiState is UiStateInProgress;

                        return state.formSubmissionUiState.toView(context,
                            successViewBuilder: (post) {
                          return SizedBox(
                            width: 100,
                            child: MtpPrimarySubmitButton(
                              isInProgress: isInProgress,
                              labelText: 'Update',
                              onPressed: _editPost,
                            ),
                          );
                        }, loadingViewBuilder: (data) {
                          return const CircularProgressIndicator();
                        }, initialViewBuilder: () {
                          return SizedBox(
                            width: 100,
                            child: MtpPrimarySubmitButton(
                              isInProgress: isInProgress,
                              labelText: 'Update',
                              onPressed: _editPost,
                            ),
                          );
                        });
                      },
                    )
                  ],
                ),
                Expanded(
                  child: TextField(
                    controller: _descriptionController,
                    maxLines: null,
                    expands: true,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: "Type here"),
                  ),
                ),
                const SizedBox(height: 10),
                _pickedImage != null && _pickedImage!.path.isNotEmpty
                    ? Flexible(
                        child: SizedBox(
                          height: 210,
                          child: Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                height: 210,
                                child: _pickedImage != null
                                    ? Image.file(
                                        _pickedImage!,
                                        fit: BoxFit.cover,
                                      )
                                    : const SizedBox(),
                              ),
                            ],
                          ),
                        ),
                      )
                    : const SizedBox(),
                _pickedVideo != null && _pickedVideo!.path.isNotEmpty
                    ? Flexible(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 210,
                              child: _pickedVideo != null
                                  ? MtpVideoPlayer(videoUrl: _pickedVideo!.path)
                                  : const SizedBox(),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5)),
                    padding: const EdgeInsets.all(10),
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ButtonWithIcon(
                              tap: () {
                                _pickImage();
                              },
                              iconData: Icons.image_outlined,
                              showText: "Image"),
                          const VerticalDivider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
                          ButtonWithIcon(
                              tap: () {
                                _pickVideo();
                              },
                              iconData: Icons.video_camera_back_outlined,
                              showText: "Video"),
                          const VerticalDivider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
                          ButtonWithIcon(
                              tap: () {}, iconData: Icons.tag, showText: "Tag"),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
