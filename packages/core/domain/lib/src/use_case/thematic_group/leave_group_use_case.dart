import 'package:base/base.dart';

import '../../../domain.dart';

class LeaveGroupUseCase {
  final ThematicGroupRepository _thematicGroupRepository;

  LeaveGroupUseCase({ThematicGroupRepository? thematicGroupRepository})
      : _thematicGroupRepository = thematicGroupRepository ?? getIt();

  Future<String> call({
    required String groupId,
  }) async {
    return _thematicGroupRepository.leaveGroup(groupId: groupId);
  }
}
