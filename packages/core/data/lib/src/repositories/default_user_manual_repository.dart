import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';

class DefaultUserManualRepository extends UserManualRepository {
  DefaultUserManualRepository({
    MtpApi? api,
  }) : _api = api ?? getIt();

  final MtpApi _api;

  @override
  Future<List<UserManual>> getUserManuals() async {
    final result = await remoteDataSourceCall(
      () => _api.getUserManuals(),
    );
    return result.map((e) => e.toDomainModel()).toList();
  }
}
