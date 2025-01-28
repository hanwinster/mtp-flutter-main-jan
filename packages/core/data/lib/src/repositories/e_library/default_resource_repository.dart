import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:preferences/preferences.dart';

class DefaultResourceRepository extends ResourceRepository {
  DefaultResourceRepository({
    MtpApi? api,
    PreferencesDataSource? prefs,
  })  : _api = api ?? getIt(),
        _prefs = prefs ?? getIt();

  final MtpApi _api;
  final PreferencesDataSource _prefs;

  // @override
  // Stream<List<Resource>> observeResources() {
  //   final result = remoteDataSourceCall(
  //         () => _api.getResources(),
  //   );
  //   return result.asStream().map((item) {
  //     return item.map((e) => e.toDomainModel()).toList();
  //   });
  // }

  @override
  Future<List<Resource>> getResources({
    required int page,
    required int limit,
    String? searchQuery,
    String? subjectId,
    String? resourceFormat,
  }) async {
    final user = await _prefs.getUser();
    final userType = user?.userRoleCode != null
        ? UserRoleCodeRM.fromDomainModel(user!.userRoleCode).toJson()
        : 'guest';

    final response = await remoteDataSourceCall(
      () => _api.getResources(
        search: searchQuery,
        resourceFormat: resourceFormat,
        subjectId: subjectId,
        limit: limit,
        page: page,
        userType: userType,
      ),
    );

    return response.map((e) => e.toDomainModel()).toList();
  }

  @override
  Future<List<ResourceFormat>> getResourceFormats() {
    return remoteDataSourceCall(
      () => _api.getResourceFormat(),
    ).then((value) => value.map((e) => e.toDomainModel()).toList());
  }

  @override
  Future<List<Subject>> getSubjects() {
    return remoteDataSourceCall(
      () => _api.getSubject(),
    ).then((value) => value.map((e) => e.toDomainModel()).toList());
  }

  @override
  Stream<Result<List<Resource>>> observeResourcesByCourseId({
    required String courseId,
  }) async* {
    try {
      final result = await remoteDataSourceCall(
        () => _api.getResourcesByCourseId(courseId: courseId),
      );
      yield ResultSuccess(result.map((e) => e.toDomainModel()).toList());
    } on Exception catch (e) {
      yield ResultError(e);
    } catch (e) {
      yield ResultError(Exception(e.toString()));
    }
  }
}
