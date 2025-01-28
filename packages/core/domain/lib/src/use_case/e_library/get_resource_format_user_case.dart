import 'package:base/base.dart';
import 'package:domain/domain.dart';

class GetResourceFormatUseCase {
  final ResourceRepository _resourceRepository;

  GetResourceFormatUseCase({ResourceRepository? resourceRepository})
      : _resourceRepository = resourceRepository ?? getIt();

  Future<List<ResourceFormat>> call() {
    return _resourceRepository.getResourceFormats();
  }
}