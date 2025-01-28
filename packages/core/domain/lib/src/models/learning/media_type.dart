enum MediaType {
  video,
  audio,
  pdf,
  image,
  unknown;

  static MediaType fromUrl(String url) {
    String extension = url.split('.').last.toLowerCase();

    // Map file extension to file type
    switch (extension) {
      case 'pdf':
        return MediaType.pdf;
      case 'png':
      case 'jpg':
      case 'jpeg':
      case 'gif':
        return MediaType.image;
      case 'mp3':
      case 'wav':
      case 'aac':
        return MediaType.audio;
      case 'mp4':
      case 'avi':
      case 'mkv':
        return MediaType.video;
      case 'doc':
      case 'docx':
        return MediaType.unknown;
      case 'xls':
      case 'xlsx':
        return MediaType.unknown;
      case 'txt':
        return MediaType.unknown;
      default:
        return MediaType.unknown;
    }
  }
}