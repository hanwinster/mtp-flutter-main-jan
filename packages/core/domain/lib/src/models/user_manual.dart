import 'package:base/base.dart';
import 'package:domain/domain.dart';

class UserManual extends Equatable {
  final String id;
  final String title;
  final String url;
  final MediaType mediaType;

  const UserManual({
    required this.id,
    required this.title,
    required this.url,
    required this.mediaType,
  });

  @override
  List<Object> get props => [id, title, url, mediaType];
}
