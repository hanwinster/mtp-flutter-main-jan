import 'package:base/base.dart';
import 'package:database/database.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'media_entity.g.dart';

@JsonSerializable()
class MediaEntity extends Equatable {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'file_name')
  final String fileName;
  @JsonKey(name: 'type', unknownEnumValue: MediaTypeEntity.unknown)
  final MediaTypeEntity type;
  @JsonKey(name: 'file_url')
  final String fileUrl;
  @JsonKey(name: 'url')
  final String url;
  @JsonKey(name: 'size')
  final int size;
  @JsonKey(name: 'human_readable_size')
  final String humanReadableSize;
  @JsonKey(name: 'extension')
  final String extension;

  const MediaEntity({
    required this.id,
    required this.fileName,
    required this.type,
    required this.fileUrl,
    required this.url,
    required this.size,
    required this.humanReadableSize,
    required this.extension,
  });

  @override
  List<Object> get props =>
      [id, fileName, type, fileUrl, url, size, humanReadableSize,];

  factory MediaEntity.fromJson(Map<String, dynamic> json) => _$MediaEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MediaEntityToJson(this);

  Media toDomainModel() {
    return Media(
      id: id,
      fileName: fileName,
      type: type.toDomainModel(),
      fileUrl: fileUrl,
      url: url,
      size: size,
      humanReadableSize: humanReadableSize,
      extension: extension,
    );
  }
}