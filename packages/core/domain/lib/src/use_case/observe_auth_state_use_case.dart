import 'package:base/base.dart';
import 'package:domain/domain.dart';

class ObserveAuthStateUseCase {
  final AuthenticationRepository _authenticationRepository;

  ObserveAuthStateUseCase({AuthenticationRepository? authenticationRepository})
      : _authenticationRepository = authenticationRepository ?? getIt();

  Stream<AuthState> call() {
    return _authenticationRepository.observeAuthState();
  }
}
