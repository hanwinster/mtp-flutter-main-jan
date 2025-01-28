import 'dart:io';

import 'package:base/base.dart';

import '../../../domain.dart';

class CreateGroupPostUseCase {
  final ThematicGroupRepository _thematicGroupRepository;

  CreateGroupPostUseCase({
    ThematicGroupRepository? thematicGroupRepository,
  }) : _thematicGroupRepository = thematicGroupRepository ?? getIt();

  Future<ThematicGroupPostCreateResponse> call({
    required String groupId,
    required String description,
    File? uploadedFile,
    File? uploadedVideo,
  }) {
    return _thematicGroupRepository.createPost(
      groupId: groupId,
      description: description,
      uploadedFile: uploadedFile,
      uploadedVideo: uploadedVideo,
    );
  }
}
