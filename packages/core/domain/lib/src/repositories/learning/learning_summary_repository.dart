import 'package:base/base.dart';
import 'package:domain/domain.dart';

abstract class LearningSummaryRepository {
  Stream<Result<LearningSummary>> observeLearningSummary({
    required String courseId,
    required String summaryId,
  });
}
