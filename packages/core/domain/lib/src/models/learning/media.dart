import 'package:base/base.dart';

import 'media_type.dart';

final class Media extends Equatable {
  final String id;
  final String fileName;
  final MediaType type;
  final String fileUrl;
  final String url;
  final int size;
  final String humanReadableSize;
  final String extension;

  const Media({
    required this.id,
    required this.fileName,
    required this.type,
    required this.fileUrl,
    required this.url,
    required this.size,
    required this.humanReadableSize,
    required this.extension,
  });

  factory Media.empty() {
    return const Media(
      id: '',
      fileName: '',
      type: MediaType.unknown,
      fileUrl: '',
      url: '',
      size: 0,
      humanReadableSize: '',
      extension: '',
    );
  }

  factory Media.fromFileUrl(String fileUrl) {
    return Media(
      id: '',
      fileName: '',
      type: MediaType.fromUrl(fileUrl),
      fileUrl: fileUrl,
      url: '',
      size: 0,
      humanReadableSize: '',
      extension: '',
    );
  }

  @override
  List<Object> get props => [id, fileName, type, fileUrl, size, humanReadableSize,];

  Media copyWith({
    String? id,
    String? fileName,
    MediaType? type,
    String? fileUrl,
    String? url,
    int? size,
    String? humanReadableSize,
    String? extension,
  }) {
    return Media(
      id: id ?? this.id,
      fileName: fileName ?? this.fileName,
      type: type ?? this.type,
      fileUrl: fileUrl ?? this.fileUrl,
      url: url ?? this.url,
      size: size ?? this.size,
      humanReadableSize: humanReadableSize ?? this.humanReadableSize,
      extension: extension ?? this.extension,
    );
  }
}