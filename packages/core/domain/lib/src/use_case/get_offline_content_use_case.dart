import 'package:base/base.dart';
import 'package:domain/domain.dart';

class GetOfflineContentUseCase {
  final OfflineContentRepository _offlineContentRepository;

  GetOfflineContentUseCase({OfflineContentRepository? offlineContentRepository})
      : _offlineContentRepository = offlineContentRepository ?? getIt();

  Future<OfflineContentModel> call() {
    return _offlineContentRepository.getOfflineContent();
  }
}
