import 'package:base/base.dart';
import 'package:domain/domain.dart';

class GetSubjectsUseCase {
  final ResourceRepository _resourceRepository;

  GetSubjectsUseCase({ResourceRepository? resourceRepository})
      : _resourceRepository = resourceRepository ?? getIt();

  Future<List<Subject>> call() {
    return _resourceRepository.getSubjects();
  }
}