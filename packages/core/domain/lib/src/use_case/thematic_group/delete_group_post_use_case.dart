
import 'package:base/base.dart';

import '../../../domain.dart';

class DeleteGroupPostUseCase{
  final ThematicGroupRepository _thematicGroupRepository;

  DeleteGroupPostUseCase({ThematicGroupRepository? thematicGroupRepository})
      : _thematicGroupRepository = thematicGroupRepository ?? getIt();

  Future<Result<ThematicGroupPostCreateResponse>> call({required String postId}){
    return _thematicGroupRepository.deletePost(postId: postId);
  }
}