import 'package:domain/domain.dart';

abstract class CmsMenuRepository {
  Future<List<CmsMenu>> getCmsMenus();
}