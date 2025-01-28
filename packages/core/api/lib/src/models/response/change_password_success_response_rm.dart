import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:json_annotation/json_annotation.dart';

import '../user_rm.dart';

part 'change_password_success_response_rm.g.dart';

@JsonSerializable(createToJson: false)
class ChangePasswordSuccessResponseRM extends Equatable {
  const ChangePasswordSuccessResponseRM({
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

  factory ChangePasswordSuccessResponseRM.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordSuccessResponseRMFromJson(json);

  @override
  List<Object?> get props => [accessToken, refreshToken, user];

  bool get isValid =>
      accessToken != null && refreshToken != null && user != null;
}

class ChangePasswordErrorResponseRM extends Equatable {
  const ChangePasswordErrorResponseRM({
    required this.message,
    required this.currentPasswordError,
    required this.passwordError,
    required this.confirmPasswordError,
  });
  final String message;
  final String? currentPasswordError;
  final String? passwordError;
  final String? confirmPasswordError;


  factory ChangePasswordErrorResponseRM.create({
    required String? message,
    required Map<String, String>? errors,
    required Map<String, dynamic>? data,
  }) {
    return ChangePasswordErrorResponseRM(
      message: message ?? '',
      currentPasswordError: errors?['current_password'],
      passwordError: errors?['password'],
      confirmPasswordError: errors?['password_confirmation'],
    );
  }

  @override
  List<Object?> get props =>
      [message, currentPasswordError, passwordError, confirmPasswordError,];
}
