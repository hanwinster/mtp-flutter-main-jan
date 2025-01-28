import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../json/converters/converters.dart';

part 'media_rm.g.dart';

@JsonSerializable(createToJson: false)
@DateTimeStringConverter()
final class MediaRM extends Equatable {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'model_type')
  final String? modelType;
  @JsonKey(name: 'model_id')
  final int? modelId;
  @JsonKey(name: 'collection_name')
  final String? collectionName;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'file_name')
  final String? fileName;
  @JsonKey(name: 'file_url')
  final String? fileUrl;
  @JsonKey(name: 'original_url')
  final String? originalUrl;
  @JsonKey(name: 'url')
  final String? url;
  @JsonKey(name: 'mime_type')
  final String? mimeType;
  @JsonKey(name: 'disk')
  final String? disk;
  @JsonKey(name: 'size')
  final int? size;
  @JsonKey(name: 'human_readable_size')
  final String? humanReadableSize;
  @JsonKey(name: 'extension')
  final String? extension;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  const MediaRM({
    this.id,
    this.modelType,
    this.modelId,
    this.collectionName,
    this.name,
    this.fileName,
    this.fileUrl,
    this.originalUrl,
    this.mimeType,
    this.disk,
    this.size,
    this.createdAt,
    this.updatedAt,
    this.url,
    this.humanReadableSize,
    this.extension,
  });

  factory MediaRM.fromJson(Map<String, dynamic> json) =>
      _$MediaRMFromJson(json);

  MediaType mapMediaType() {
    switch (mimeType) {
      case 'video/mp4':
        return MediaType.video;
      case 'application/pdf':
        return MediaType.pdf;
      case 'image/jpeg':
        case 'image/jpg':
      case 'image/png':
        return MediaType.image;
      default:
        return MediaType.unknown;
    }
  }

  Media toDomainModel() {
    return Media(
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

  @override
  List<Object?> get props => [
        id,
        modelType,
        modelId,
        collectionName,
        name,
        fileName,
        fileUrl,
        mimeType,
        disk,
        createdAt,
        updatedAt,
      ];
}
