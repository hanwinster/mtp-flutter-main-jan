import 'package:base/base.dart';

import '../../../domain.dart';

class GetGroupCategoriesUseCase {
  final ThematicGroupRepository _thematicGroupRepository;

  GetGroupCategoriesUseCase({
    ThematicGroupRepository? thematicGroupRepository,
  }) : _thematicGroupRepository = thematicGroupRepository ?? getIt();

  Future<List<ThematicGroupCategory>> call() {
    return _thematicGroupRepository.getCategories();
  }
}
