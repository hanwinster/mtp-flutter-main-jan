import 'package:base/base.dart';
import 'package:domain/domain.dart';

class ObserveEducationYearsUseCase {
  final EducationYearRepository _educationYearRepository;

  ObserveEducationYearsUseCase({EducationYearRepository? educationYearRepository})
      : _educationYearRepository = educationYearRepository ?? getIt();

  Stream<Result<List<EducationYear>>> call() {
    return _educationYearRepository.observeEducationYears();
  }
}
