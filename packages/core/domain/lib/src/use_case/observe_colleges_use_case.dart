import 'package:base/base.dart';
import 'package:domain/domain.dart';

class ObserveCollegesUseCase {
  final CollegeRepository _collegeRepository;

  ObserveCollegesUseCase({CollegeRepository? collegeRepository})
      : _collegeRepository = collegeRepository ?? getIt();

  Stream<Result<List<College>>> call() {
    return _collegeRepository.observeColleges();
  }
}
