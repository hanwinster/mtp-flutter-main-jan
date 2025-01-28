import 'package:base/base.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_message_data_response.g.dart';

// We need this class because of some API responses message in side the data
@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class ApiMessageDataResponse<T> extends Equatable {
  const ApiMessageDataResponse(
    this.message,
    this.data,
  );

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'data')
  final T? data;

  factory ApiMessageDataResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ApiMessageDataResponseFromJson(json, fromJsonT);

  @override
  List<Object?> get props => [message, data];
}
