import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:json_annotation/json_annotation.dart';

import '../user_rm.dart';

part 'login_response_rm.g.dart';

@JsonSerializable(createToJson: false)
class LoginSuccessResponseRM extends Equatable {
  const LoginSuccessResponseRM({
    this.accessToken,
    this.refreshToken,
    this.user,
  });

  @JsonKey(name: 'access_token')
  final String? accessToken;
  @JsonKey(name: 'refresh_token')
  final String? refreshToken;
  @JsonKey(name: 'user')
  final UserRM? user;

  factory LoginSuccessResponseRM.fromJson(Map<String, dynamic> json) =>
      _$LoginSuccessResponseRMFromJson(json);

  @override
  List<Object?> get props => [accessToken, refreshToken, user];

  bool get isValid =>
      accessToken != null && refreshToken != null && user != null;
}

class LoginErrorResponseRM extends Equatable {
  const LoginErrorResponseRM({
    required this.message,
    required this.usernameError,
    required this.passwordError,
    required this.isVerified,
    required this.hasUnverifiedStatus,
  });

  factory LoginErrorResponseRM.create({
    required String? message,
    required Map<String, String>? errors,
    required Map<String, dynamic>? data,
  }) {
    return LoginErrorResponseRM(
      message: message ?? '',
      usernameError: errors?['username'],
      passwordError: errors?['password'],
      isVerified: data?['verified'] == 1,
      hasUnverifiedStatus: data?.containsKey('verified') == true,
    );
  }

  final String message;
  final String? usernameError;
  final String? passwordError;
  final bool isVerified;
  final bool hasUnverifiedStatus;

  bool get isInvalidCredentials =>
      usernameError != null || passwordError != null;

  @override
  List<Object?> get props => [
        message,
        usernameError,
        passwordError,
        isVerified,
        hasUnverifiedStatus,
      ];
}
