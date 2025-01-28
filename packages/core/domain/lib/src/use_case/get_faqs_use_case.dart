import 'package:base/base.dart';
import 'package:domain/domain.dart';

class GetFaqsUseCase {
  GetFaqsUseCase({
    FaqRepository? faqRepository,
  }) : _faqRepository =
        faqRepository ?? getIt();

  final FaqRepository _faqRepository;

  Future<List<Faq>> call() {
    return _faqRepository.getFaqs();
  }
}