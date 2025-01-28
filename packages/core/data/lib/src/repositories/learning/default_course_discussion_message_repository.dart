import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';

class DefaultCourseDiscussionMessageRepository
    extends CourseDiscussionMessageRepository {
  DefaultCourseDiscussionMessageRepository({
    MtpApi? api,
  }) : _api = api ?? getIt();

  final MtpApi _api;

  @override
  Stream<Result<List<CourseDiscussionMessage>>> observeDiscussionMessages({
    required String courseId,
  }) async* {
    try {
      yield ResultLoading();
      final response = await remoteDataSourceCall(
        () => _api.getCourseDiscussionMessages(
          courseId: courseId.toIntOrThrow(),
        ),
      );
      yield ResultSuccess(response.map((e) => e.toDomainModel()).toList());
    } on Exception catch (e) {
      yield ResultError(e);
    } catch (e) {
      yield ResultError(Exception(e.toString()));
    }
  }

  @override
  Future<void> createDiscussionMessage({
    required String courseId,
    required String discussionId,
    required String message,
  }) async {
    try {
      await remoteDataSourceCall(
        () => _api.createDiscussionMessage(
          courseId: courseId.toIntOrThrow(),
          discussionId: discussionId.toIntOrThrow(),
          message: message,
        ),
      );
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
