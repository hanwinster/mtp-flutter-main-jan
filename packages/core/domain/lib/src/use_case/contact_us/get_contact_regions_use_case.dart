import 'package:base/base.dart';
import 'package:domain/domain.dart';

class GetContactRegionsUseCase {
  GetContactRegionsUseCase({
    ContactInfoRepository? repository,
  }) : _repository =
        repository ?? getIt();

  final ContactInfoRepository _repository;

  Future<List<ContactRegion>> call() {
    return _repository.getContactRegions();
  }
}