import 'package:base/base.dart';
import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_response_rm.g.dart';

@JsonSerializable(createToJson: false)
class RefreshTokenResponseRM extends Equatable {
  const RefreshTokenResponseRM({
    this.accessToken,
    this.refreshToken,
  });

  @JsonKey(name: 'access_token')
  final String? accessToken;
  @JsonKey(name: 'refresh_token')
  final String? refreshToken;

  factory RefreshTokenResponseRM.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenResponseRMFromJson(json);

  @override
  List<Object?> get props => [
        accessToken,
        refreshToken,
      ];

  bool get isValid => accessToken != null && refreshToken != null;
}
