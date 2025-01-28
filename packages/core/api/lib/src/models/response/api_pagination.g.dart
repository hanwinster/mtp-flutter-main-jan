// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiPagination _$ApiPaginationFromJson(Map<String, dynamic> json) =>
    ApiPagination(
      (json['total'] as num?)?.toInt(),
      (json['per_page'] as num?)?.toInt(),
      (json['current_page'] as num?)?.toInt(),
      (json['last_page'] as num?)?.toInt(),
      (json['from'] as num?)?.toInt(),
      (json['to'] as num?)?.toInt(),
    );
