import 'package:base/base.dart';
import 'package:domain/domain.dart';

class GetCmsMenusUseCase {
  GetCmsMenusUseCase({
    CmsMenuRepository? repository,
  }) : _repository =
      repository ?? getIt();

  final CmsMenuRepository _repository;

  Future<List<CmsMenu>> call() {
    return _repository.getCmsMenus();
  }
}