import 'package:domain/domain.dart';

abstract class FaqRepository {
  Future<List<Faq>> getFaqs();
}