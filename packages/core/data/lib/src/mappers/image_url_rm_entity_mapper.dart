import 'package:api/api.dart';
import 'package:database/database.dart';

extension ImageUrlRMEntityMapper on ImageUrlRM {
  ImageUrlEntity toEntity() {
    return ImageUrlEntity(
      original: original ?? '',
      thumbnail: thumbnail ?? '',
      medium: medium ?? '',
      large: large ?? '',
    );
  }
}
