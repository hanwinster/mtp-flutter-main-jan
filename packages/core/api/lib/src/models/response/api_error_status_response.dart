import 'package:base/base.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_error_status_response.g.dart';

@JsonSerializable(createToJson: false)
class ApiErrorStatusResponse extends Equatable {
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'errors')
  final Map<String, String>? errors;
  @JsonKey(name: 'data')
  final dynamic data;

  const ApiErrorStatusResponse(
    this.message,
    this.errors,
    this.data,
  );

  factory ApiErrorStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorStatusResponseFromJson(json);

  @override
  List<Object?> get props => [errors];
}
