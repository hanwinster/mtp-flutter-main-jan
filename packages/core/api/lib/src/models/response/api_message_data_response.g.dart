// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_message_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiMessageDataResponse<T> _$ApiMessageDataResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ApiMessageDataResponse<T>(
      json['message'] as String?,
      _$nullableGenericFromJson(json['data'], fromJsonT),
    );

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);
