import 'package:base/base.dart';
import 'package:domain/domain.dart';

class GetCurrentVersionUseCase {
  final VersionCheckRepo _versionCheckRepo ;

  GetCurrentVersionUseCase({VersionCheckRepo? versionCheckRepo})
      : _versionCheckRepo = versionCheckRepo ?? getIt();

  Future<Version> call() {
    return _versionCheckRepo.getCurrentVersion();
  }
}
