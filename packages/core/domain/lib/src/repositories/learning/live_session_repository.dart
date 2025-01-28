import 'package:base/base.dart';
import 'package:domain/domain.dart';

abstract class LiveSessionRepository {
  Stream<Result<LiveSession>> observeLiveSession({
    required String courseId,
    required String liveSessionId,
  });
}
