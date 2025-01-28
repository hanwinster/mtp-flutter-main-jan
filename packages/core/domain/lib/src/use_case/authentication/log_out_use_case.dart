import 'package:base/base.dart';
import 'package:domain/domain.dart';

class LogOutUseCase {
  LogOutUseCase({
    AuthenticationRepository? authenticationRepository,
  }) : _authenticationRepository = authenticationRepository ?? getIt();
  final AuthenticationRepository _authenticationRepository;

  Future<void> call() async {
    await _authenticationRepository.logout();
  }
}
