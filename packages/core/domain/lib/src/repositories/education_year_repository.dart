import 'package:base/base.dart';
import 'package:domain/domain.dart';

abstract class EducationYearRepository {
  Stream<Result<List<EducationYear>>> observeEducationYears();
}
