import 'dart:io';

import 'package:base/base.dart';

import '../../../domain.dart';

class EditGroupPostUseCase {
  final ThematicGroupRepository _thematicGroupRepository;

  EditGroupPostUseCase({
    ThematicGroupRepository? thematicGroupRepository,
  }) : _thematicGroupRepository = thematicGroupRepository ?? getIt();

  Future<void> call({
    required String post_id,
    required String group_id,
    required String description,
    File? uploadedFile,
    File? uploadedVideo,
  }) {
    return _thematicGroupRepository.editPost(
      post_id: post_id,
      group_id: group_id,
      description: description,
      uploadedFile: uploadedFile,
      uploadedVideo: uploadedVideo,
    );
  }
}
