import 'package:base/base.dart';
import 'package:domain/domain.dart';

class ObserveLiveSessionUseCaseRequest extends Equatable {
  const ObserveLiveSessionUseCaseRequest({
    required this.courseId,
    required this.liveSessionId,
  });

  final String courseId;
  final String liveSessionId;

  @override
  List<Object?> get props => [courseId, liveSessionId];
}

class ObserveLiveSessionUseCase {
  ObserveLiveSessionUseCase({
    LiveSessionRepository? liveSessionRepository,
  }) : _liveSessionRepository = liveSessionRepository ?? getIt();

  final LiveSessionRepository _liveSessionRepository;

  Stream<Result<LiveSession?>> call(
      ObserveLiveSessionUseCaseRequest request) {
    return _liveSessionRepository.observeLiveSession(
      courseId: request.courseId,
      liveSessionId: request.liveSessionId,
    );
  }
}
