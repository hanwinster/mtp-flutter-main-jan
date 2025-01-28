import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';


class DefaultEducationYearRepository extends EducationYearRepository {
  DefaultEducationYearRepository({
    MtpApi? api,
  }) : _api = api ?? getIt();

  final MtpApi _api;

  @override
  Stream<Result<List<EducationYear>>> observeEducationYears() async* {
    try {
      final response = await remoteDataSourceCall(
        () => _api.getEducationYears(),
      );
      yield ResultSuccess(response.map((e) => e.toDomainModel()).toList());
    } on Exception catch (e) {
      yield ResultError(e);
    }
  }
}
