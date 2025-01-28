import 'package:api/api.dart';
import 'package:database/database.dart';

extension MediaRMEntityMapper on MediaRM {

  MediaTypeEntity mapMediaType() {
    switch (mimeType) {
      case 'video/mp4':
        return MediaTypeEntity.video;
      case 'application/pdf':
        return MediaTypeEntity.pdf;
      case 'image/jpeg':
      case 'image/jpg':
      case 'image/png':
        return MediaTypeEntity.image;
      default:
        return MediaTypeEntity.unknown;
    }
  }

  MediaEntity toEntity() {
    return MediaEntity(
      id: id?.toString() ?? '',
      type: mapMediaType(),
      fileUrl: fileUrl ?? originalUrl ?? '',
      url: url ?? '',
      size: size ?? 0,
      fileName: fileName ?? '',
      humanReadableSize: humanReadableSize ?? '',
      extension: extension ?? '',
    );
  }
}
