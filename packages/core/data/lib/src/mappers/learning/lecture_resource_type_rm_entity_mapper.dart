import 'package:api/api.dart';
import 'package:database/database.dart';

extension LectureResourceTypeRMEntityMapper on LectureResourceTypeRM {
  LectureResourceTypeEntity toEntity() {
    switch (this) {
      case LectureResourceTypeRM.none:
        return LectureResourceTypeEntity.none;
      case LectureResourceTypeRM.attachFile:
        return LectureResourceTypeEntity.attachFile;
      default:
        return LectureResourceTypeEntity.embedVideo;
    }
  }
}
