import 'package:base/base.dart';
import 'package:domain/domain.dart';

class GetSlideListUseCase {
  final SlideRepository _slideRepository;

  GetSlideListUseCase({SlideRepository? slideRepository})
      : _slideRepository = slideRepository ?? getIt();

  Future<List<SlideModel>> call() {
    return _slideRepository.getSlides();
  }
}
