import 'package:base/base.dart';
import 'package:domain/domain.dart';

class GetCurrentUserIdUseCase {
  final AuthenticationRepository _authenticationRepository;

  GetCurrentUserIdUseCase({AuthenticationRepository? authenticationRepository})
      : _authenticationRepository = authenticationRepository ?? getIt();

  Future<String> call() {
    return _authenticationRepository.getCurrentUserId();
  }
}
