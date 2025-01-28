import 'package:base/base.dart';

class College extends Equatable {
  const College({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  @override
  List<Object> get props => [
        id,
        name,
      ];
}
