import 'package:base/base.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_pagination.g.dart';

@JsonSerializable(createToJson: false)
class ApiPagination extends Equatable {
  const ApiPagination(
    this.total,
    this.perPage,
    this.currentPage,
    this.lastPage,
    this.from,
    this.to,
  );

  @JsonKey(name: 'total')
  final int? total;
  @JsonKey(name: 'per_page')
  final int? perPage;
  @JsonKey(name: 'current_page')
  final int? currentPage;
  @JsonKey(name: 'last_page')
  final int? lastPage;
  @JsonKey(name: 'from')
  final int? from;
  @JsonKey(name: 'to')
  final int? to;

  factory ApiPagination.fromJson(Map<String, dynamic> json) =>
      _$ApiPaginationFromJson(json);

  @override
  List<Object?> get props => [
        total,
        perPage,
        currentPage,
        lastPage,
        from,
        to,
      ];
}
