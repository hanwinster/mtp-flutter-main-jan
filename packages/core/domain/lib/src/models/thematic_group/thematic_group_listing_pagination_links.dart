import 'package:equatable/equatable.dart';

class PaginationLinks extends Equatable {
  final String? first;
  final String? last;
  final String? prev;
  final String? next;

  const PaginationLinks({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  @override
  List<Object?> get props => [first, last, prev, next];
}
