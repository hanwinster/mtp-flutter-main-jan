import 'package:base/base.dart';
import 'package:domain/domain.dart';

class ObserveResourcesUseCase {
  final ResourceRepository _bookRepository;

  ObserveResourcesUseCase({ResourceRepository? bookRepository})
      : _bookRepository = bookRepository ?? getIt();

  // Stream<List<Resource>> call({required int page, required int limit, required String query, required String subject, required String resourceFormat}) {
  //   return _bookRepository.observeResources();
  // }
}