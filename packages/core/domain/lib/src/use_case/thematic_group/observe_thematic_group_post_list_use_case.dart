import 'package:base/base.dart';
import 'package:domain/domain.dart';

class ObserveThematicGroupPostListUseCase {
  final ThematicGroupRepository _thematicGroupRepository;

  ObserveThematicGroupPostListUseCase({ThematicGroupRepository? thematicGroupRepository})
      : _thematicGroupRepository = thematicGroupRepository ?? getIt();

  Stream<Result<List<ThematicGroupPost>>> call({required int page, int? pageSize,required String group_id}) {
    return _thematicGroupRepository.observeGroupPost(page: page, pageSize: pageSize,group_id: group_id);
  }
}
