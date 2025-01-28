import 'package:base/base.dart';
import 'package:domain/domain.dart';

class ObserveLearningSummaryUseCaseRequest extends Equatable {
  const ObserveLearningSummaryUseCaseRequest({
    required this.courseId,
    required this.summaryId,
  });

  final String courseId;
  final String summaryId;

  @override
  List<Object?> get props => [courseId, summaryId];
}

class ObserveLearningSummaryUseCase {
  ObserveLearningSummaryUseCase({
    LearningSummaryRepository? learningSummaryRepository,
  }) : _learningSummaryRepository = learningSummaryRepository ?? getIt();

  final LearningSummaryRepository _learningSummaryRepository;

  Stream<Result<LearningSummary>> call(
      ObserveLearningSummaryUseCaseRequest request) {
    return _learningSummaryRepository.observeLearningSummary(
      courseId: request.courseId,
      summaryId: request.summaryId,
    );
  }
}
