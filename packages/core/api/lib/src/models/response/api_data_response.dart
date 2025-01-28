import 'package:base/base.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_data_response.g.dart';

@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class ApiDataResponse<T> extends Equatable {
  const ApiDataResponse(
    this.message,
    this.data,
  );

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'data')
  final T data;

  factory ApiDataResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ApiDataResponseFromJson(json, fromJsonT);

  @override
  List<T> get props => [data];
}
