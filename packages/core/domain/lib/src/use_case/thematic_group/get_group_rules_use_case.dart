import 'package:base/base.dart';

import '../../../domain.dart';

class GetGroupRulesUseCase{
  final ThematicGroupRepository _thematicGroupRepository;

  GetGroupRulesUseCase({ThematicGroupRepository? thematicGroupRepository})
      : _thematicGroupRepository = thematicGroupRepository ?? getIt();

  Future<ThematicGroupRulesResponse> call(){
    return _thematicGroupRepository.getGroupRules();
  }

// Stream<Result<List<ThematicGroupListing>>> call() {
//   return _thematicGroupRepository.observeGroups();
// }
}