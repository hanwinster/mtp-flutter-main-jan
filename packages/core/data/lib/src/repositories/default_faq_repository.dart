import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';

class DefaultFaqRepository extends FaqRepository {
  DefaultFaqRepository({
    MtpApi? api,
  }) : _api = api ?? getIt();

  final MtpApi _api;

  @override
  Future<List<Faq>> getFaqs() async {
    final response = await remoteDataSourceCall(
      () => _api.getFaqs(),
    );
    return response.map((e) => e.toDomainModel()).toList();
  }
}
