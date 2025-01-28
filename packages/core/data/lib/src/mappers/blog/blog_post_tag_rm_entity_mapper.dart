import 'package:api/api.dart';
import 'package:database/database.dart';

extension BlogPostTagRMEntityMapper on BlogPostTagRM {
  BlogPostTagEntity toEntity() {
    return BlogPostTagEntity(
      id: id?.toString() ?? (throw Exception('id must not be null')),
      name: name ?? '',
    );
  }
}
