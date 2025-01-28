import 'package:base/base.dart';

import '../../../domain.dart';

class RequestGroupJoinUseCase {
  final ThematicGroupRepository _thematicGroupRepository;

  RequestGroupJoinUseCase({
    ThematicGroupRepository? thematicGroupRepository,
  }) : _thematicGroupRepository = thematicGroupRepository ?? getIt();

  Future<ThematicGroupRequestResponse> call({
    required String groupId,
    required bool isApproved,
  }) {
    return _thematicGroupRepository.requestJoinGroup(
      groupId: groupId,
      isApproved: isApproved,
    );
  }
}
