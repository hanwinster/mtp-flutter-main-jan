import 'package:base/base.dart';
import 'package:domain/domain.dart';

class GetResourcesUseCase {
  final ResourceRepository _bookRepository;

  GetResourcesUseCase({ResourceRepository? bookRepository})
      : _bookRepository = bookRepository ?? getIt();

  Future<List<Resource>> call({required int page, required int limit, String? query, String? subject, String? resourceFormat}) {
    return _bookRepository.getResources(page: page, limit: limit, searchQuery: query, subjectId: subject, resourceFormat: resourceFormat);
  }
}