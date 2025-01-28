import 'package:base/base.dart';
import 'package:domain/domain.dart';

abstract class ResourceRepository {
  // Stream<List<Resource>> observeResources();
  Future<List<Resource>> getResources({
    required int page,
    required int limit,
    String? searchQuery,
    String? subjectId,
    String? resourceFormat,
  });

  Future<List<ResourceFormat>> getResourceFormats();

  Future<List<Subject>> getSubjects();

  Stream<Result<List<Resource>>> observeResourcesByCourseId({
    required String courseId,
  });
}
