import 'package:base/base.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_status_response.g.dart';

@JsonSerializable(createToJson: false)
class ApiStatusResponse extends Equatable {
  @JsonKey(name: 'code')
  final int? statusCode;
  @JsonKey(name: 'message')
  final String? message;

  const ApiStatusResponse(this.statusCode, this.message);

  factory ApiStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiStatusResponseFromJson(json);

  @override
  List<Object?> get props => [statusCode, message];
}
