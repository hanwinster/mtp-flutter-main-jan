import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';

class DefaultSlideRepository extends SlideRepository {

  DefaultSlideRepository({
    MtpApi? api,
  })  : _api = api ?? getIt();

  final MtpApi _api;


  @override
  Future<List<SlideModel>> getSlides() {
    return remoteDataSourceCall(
          () => _api.getSlides().then((value) => value.map((e) => e.toDomainModel()).toList()),
    );
  }

}