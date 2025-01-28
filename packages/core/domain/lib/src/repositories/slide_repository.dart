import 'package:domain/domain.dart';

abstract class SlideRepository {
  Future<List<SlideModel>> getSlides();
}