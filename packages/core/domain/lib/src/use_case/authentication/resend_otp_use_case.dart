import 'package:base/base.dart';
import 'package:domain/domain.dart';

class ResendOtpRequest extends Equatable {
  const ResendOtpRequest({
    required this.credential,
  });

  final String credential;

  @override
  List<Object?> get props => [
        credential,
      ];
}

abstract class ResendOtpResult extends Equatable {
  const ResendOtpResult(
    this.isSuccessful,
    this.message,
  );

  final bool isSuccessful;
  final String message;

  @override
  List<Object?> get props => [isSuccessful, message];
}

final class ResendOtpResultSuccess extends ResendOtpResult {
  const ResendOtpResultSuccess({
    required String message,
  }) : super(true, message);
}

final class ResendOtpResultError extends ResendOtpResult {
  const ResendOtpResultError({
    required String message,
  }) : super(false, message);
}

class ResendOtpUseCase {
  ResendOtpUseCase({
    AuthenticationRepository? authenticationRepository,
  }) : _authenticationRepository = authenticationRepository ?? getIt();

  final AuthenticationRepository _authenticationRepository;

  Future<ResendOtpResult> call(ResendOtpRequest request) {
    return _authenticationRepository.resendOtp(
      email: request.credential,
    );
  }
}
