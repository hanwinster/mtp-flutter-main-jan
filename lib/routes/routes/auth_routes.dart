part of '../app_shell_routes.dart';

const String loginPath = '/login';
const String registerPath = '/register';
const String otpVerificationPath = '/otp-verification';
const String forgotPasswordPath = '/forgot-password';
const String resetPasswordPath = '/reset-password';
const String authSuccessPath = '/auth-success';

@TypedGoRoute<LoginRoute>(
  path: loginPath,
)
class LoginRoute extends GoRouteData {
  const LoginRoute({
    this.fromPage,
  });

  final String? fromPage;

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return LoginScreenEntry(
      onCreateNewUser: () async {
        await RegisterRoute().push(context);
      },
      onUnverifiedUser: ({
        required String credential,
      }) async {
        final result = await OtpVerificationRoute(
          credential: credential,
          verificationContext: OtpVerificationContext.login,
        ).push(context);
        if (result is Map && context.mounted) {
          final message = result['message'] as String;
          final resultOk = result['result_ok'] as bool;
          if (resultOk) {
            AuthSuccessRoute(
              message: message,
            ).push(context);
          }
        }
      },
      onForgotPassword: () async {
        final forgotPasswordResult = await ForgotPasswordRoute().push(context);
        if (forgotPasswordResult is Map && context.mounted) {
          final credential = forgotPasswordResult['credential'] as String;
          final resultOk = forgotPasswordResult['result_ok'] as bool;
          if (resultOk) {
            final otpVerificationResult = await OtpVerificationRoute(
              credential: credential,
              verificationContext: OtpVerificationContext.resetPassword,
            ).push(context);
            if (otpVerificationResult is Map && context.mounted) {
              final message = otpVerificationResult['message'] as String;
              final resultOk = otpVerificationResult['result_ok'] as bool;
              if (resultOk) {
                final resetPasswordResult = await ResetPasswordRoute(
                  credential: credential,
                  otp: otpVerificationResult['otp'] as String,
                ).push(context);
                if (resetPasswordResult is Map && context.mounted) {
                  final credential =
                      resetPasswordResult['credential'] as String;
                  final message = resetPasswordResult['message'] as String;
                  final resultOk = resetPasswordResult['result_ok'] as bool;
                  if (resultOk) {
                    AuthSuccessRoute(
                      message: message,
                    ).push(context);
                  }
                }
              }
            }
          }
        }
      },
      onLoginSuccess: () {
        if (fromPage != null) {
          context.go(fromPage!);
        } else {
          Navigator.pop(context, true);
        }
      },
    );
  }
}

void navigateToLogin(BuildContext context) async {
  final result = await LoginRoute().push(context);
}

Future<bool> navigateToLoginWithResult(BuildContext context) async {
  final result = await const LoginRoute().push<bool?>(context);
  return result ?? false;
}

@TypedGoRoute<RegisterRoute>(
  path: registerPath,
)
class RegisterRoute extends GoRouteData {
  const RegisterRoute();

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  void _navigateToRegisterOtpVerification(
    BuildContext context, {
    required String credential,
  }) async {
    final result = await OtpVerificationRoute(
      credential: credential,
      verificationContext: OtpVerificationContext.login,
    ).push(context);
    if (result is Map && context.mounted) {
      final message = result['message'] as String;
      final resultOk = result['result_ok'] as bool;
      if (resultOk) {
        AuthSuccessRoute(
          message: message,
        ).push(context);
      }
    }
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return RegisterScreenEntry(
      onFormSubmitted: ({
        required String email,
      }) {
        _navigateToRegisterOtpVerification(
          context,
          credential: email,
        );
      },
      onUnverifiedUser: ({
        required String credential,
      }) {
        _navigateToRegisterOtpVerification(
          context,
          credential: credential,
        );
      },
    );
  }
}

@TypedGoRoute<ForgotPasswordRoute>(
  path: forgotPasswordPath,
)
class ForgotPasswordRoute extends GoRouteData {
  const ForgotPasswordRoute();

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ForgotPasswordScreenEntry(
      onResetPasswordTokenSent: ({
        required String credential,
      }) {
        Navigator.pop(context, <String, dynamic>{
          'credential': credential,
          'result_ok': true,
        });
      },
      onUnverifiedUser: ({
        required String credential,
      }) async {
        final result = await OtpVerificationRoute(
          credential: credential,
          verificationContext: OtpVerificationContext.login,
        ).push(context);
        if (result is Map && context.mounted) {
          final message = result['message'] as String;
          final resultOk = result['result_ok'] as bool;
          if (resultOk) {
            AuthSuccessRoute(
              message: message,
            ).push(context);
          }
        }
      },
    );
  }
}

@TypedGoRoute<ResetPasswordRoute>(
  path: resetPasswordPath,
)
class ResetPasswordRoute extends GoRouteData {
  const ResetPasswordRoute({
    required this.credential,
    required this.otp,
  });

  final String credential;
  final String otp;
  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ResetPasswordScreenEntry(
      credential: credential,
      otp: otp,
      onPasswordResetSuccess: ({
        required String credential,
        required String message,
      }) {
        Navigator.pop(context, <String, dynamic>{
          'credential': credential,
          'message': message,
          'result_ok': true,
        });
      },
    );
  }
}

@TypedGoRoute<OtpVerificationRoute>(
  path: otpVerificationPath,
)
class OtpVerificationRoute extends GoRouteData {
  const OtpVerificationRoute({
    required this.credential,
    required this.verificationContext,
  });

  final String credential;
  final OtpVerificationContext verificationContext;

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return OtpVerificationScreenEntry(
      verificationContext: verificationContext,
      credential: credential,
      onOtpVerified: ({
        required String message,
        required String credential,
        required String otp,
      }) {
        Navigator.pop(context, <String, dynamic>{
          'message': message,
          'credential': credential,
          'otp': otp,
          'result_ok': true,
        });
      },
    );
  }
}

@TypedGoRoute<AuthSuccessRoute>(
  path: authSuccessPath,
)
class AuthSuccessRoute extends GoRouteData {
  const AuthSuccessRoute({
    required this.message,
  });

  final String message;

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SuccessScreenEntry(
      message: message,
      onPositiveButtonClicked: () {
        LoginRoute(
          fromPage: HomeRoute().location,
        ).push(context);
      },
    );
  }
}
