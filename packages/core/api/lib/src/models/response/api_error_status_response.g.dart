// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiErrorStatusResponse _$ApiErrorStatusResponseFromJson(
        Map<String, dynamic> json) =>
    ApiErrorStatusResponse(
      json['message'] as String?,
      (json['errors'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      json['data'],
    );
