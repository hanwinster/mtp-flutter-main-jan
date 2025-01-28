import 'package:base/base.dart';

class ContactRegion extends Equatable {
  final String id;
  final String name;

  const ContactRegion({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [id, name];
}