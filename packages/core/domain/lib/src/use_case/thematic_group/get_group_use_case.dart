
import 'package:base/base.dart';

import '../../../domain.dart';

class GetGroupUseCaseRequest extends Equatable {
  final String groupId;

  const GetGroupUseCaseRequest({
    required this.groupId,
  });

  @override
  List<Object> get props => [groupId];
}

class GetGroupUseCase {
  final ThematicGroupRepository _thematicGroupRepository;

  GetGroupUseCase({
    ThematicGroupRepository? thematicGroupRepository,
  }) : _thematicGroupRepository = thematicGroupRepository ?? getIt();

  Future<ThematicGroupListing> call(GetGroupUseCaseRequest request) {
    return _thematicGroupRepository.getGroup(
      groupId: request.groupId,
    );
  }
}
