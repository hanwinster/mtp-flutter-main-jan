import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';

class DefaultVersionCheckRepoImp extends VersionCheckRepo {
  DefaultVersionCheckRepoImp({
    MtpApi? api,
  }) : _api = api ?? getIt();

  final MtpApi _api;
  
  @override
  Future<Version> getCurrentVersion() async{ 
     final response = await remoteDataSourceCall(
      () => _api.getCurrentVersion(),
    );
    return response;
  }
 
}
