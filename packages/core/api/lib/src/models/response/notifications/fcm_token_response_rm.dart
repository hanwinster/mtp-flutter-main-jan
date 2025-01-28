import 'package:api/api.dart';
import 'package:domain/domain.dart'; // Import your domain models here
import 'package:json_annotation/json_annotation.dart';

part 'fcm_token_response_rm.g.dart';

@JsonSerializable(createToJson: false)
class FcmTokenResponseRM {
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'data')
  final UserRM? data;

  const FcmTokenResponseRM({
    this.message,
    this.data,
  });

  // Convert to Domain Model
  FcmTokenUpdateResponse toDomainModel() => FcmTokenUpdateResponse(
    message: message ?? '',
    data: data?.toDomainModel() ?? User.empty(),
  );

  factory FcmTokenResponseRM.fromJson(Map<String, dynamic> json) =>
      _$FcmTokenResponseRMFromJson(json);
}