import 'package:base/base.dart';
import 'package:domain/domain.dart';

abstract class DeactivateResult extends Equatable {
  const DeactivateResult(this.isSuccessful,
      this.message,);

  final bool isSuccessful;
  final String message;

  @override
  List<Object?> get props => [isSuccessful, message];
}

final class DeactivateResultSuccess extends DeactivateResult {
  const DeactivateResultSuccess({
    required String message,
  }) : super(true, message);
}

final class DeactivateResultError extends DeactivateResult {
  const DeactivateResultError({
    required String message,
  }) : super(false, message);
}

class DeactivateUseCase {
  DeactivateUseCase({
    AuthenticationRepository? authenticationRepository,
  }) : _authenticationRepository = authenticationRepository ?? getIt();
  final AuthenticationRepository _authenticationRepository;

  Future<dynamic> call() async {
    return _authenticationRepository.deactivate();
  }
}