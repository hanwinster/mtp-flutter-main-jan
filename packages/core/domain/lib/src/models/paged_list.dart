import 'package:base/base.dart';

class PagedList<T> extends Equatable {
  final int total;
  final List<T> items;

  const PagedList({
    required this.total,
    required this.items,
  });

  @override
  List<Object> get props => [total, items];

  bool get isEmpty => items.isEmpty;
}