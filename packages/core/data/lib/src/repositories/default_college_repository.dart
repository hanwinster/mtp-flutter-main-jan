import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';


class DefaultCollegeRepository extends CollegeRepository {
  DefaultCollegeRepository({
    MtpApi? api,
  }) : _api = api ?? getIt();

  final MtpApi _api;

  @override
  Stream<Result<List<College>>> observeColleges() async* {
    try {
      final response = await remoteDataSourceCall(
        () => _api.getColleges(),
      );
      yield ResultSuccess(response.map((e) => e.toDomainModel()).toList());
    } on Exception catch (e) {
      yield ResultError(e);
    }
  }
}
