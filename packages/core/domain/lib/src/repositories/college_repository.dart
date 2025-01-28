import 'package:base/base.dart';
import 'package:domain/domain.dart';

abstract class CollegeRepository {
  Stream<Result<List<College>>> observeColleges();
}
