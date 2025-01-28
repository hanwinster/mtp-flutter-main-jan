import 'package:base/base.dart';

class EducationYear extends Equatable {
  const EducationYear({
    required this.id,
    required this.title,
  });

  final String id;
  final String title;

  @override
  List<Object> get props => [id, title];

}