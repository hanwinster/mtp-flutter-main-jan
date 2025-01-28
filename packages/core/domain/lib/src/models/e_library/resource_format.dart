import 'package:base/base.dart';

class ResourceFormat extends Equatable {

  final String id;
  final String title;


  const ResourceFormat({
    required this.id,
    required this.title,
  });

  @override
  List<Object> get props => [id, title];
}