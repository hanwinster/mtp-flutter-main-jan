import 'package:base/base.dart';
import 'package:json_annotation/json_annotation.dart';

import 'api_pagination.dart';

part 'api_paginated_response.g.dart';

@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class ApiPaginatedResponse<T> extends Equatable {
  const ApiPaginatedResponse(this.pagination, this.data);

  @JsonKey(name: 'meta')
  final ApiPagination? pagination;
  @JsonKey(name: 'data')
  final List<T> data;

  factory ApiPaginatedResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ApiPaginatedResponseFromJson(json, fromJsonT);

  @override
  List<Object?> get props => [pagination, data];
}
