import 'package:domain/domain.dart';
import 'package:hive/hive.dart';

import '../hive_ids.dart';

part 'image_url_preference.g.dart';

@HiveType(typeId: HiveTypeId.imageUrlPreference)
class ImageUrlPreference {
  const ImageUrlPreference({
    required this.original,
    required this.thumbnail,
    required this.medium,
    required this.large,
  });

  @HiveField(0)
  final String original;
  @HiveField(1)
  final String thumbnail;
  @HiveField(2)
  final String medium;
  @HiveField(3)
  final String large;

  factory ImageUrlPreference.fromDomainModel(ImageUrl imageUrl) {
    return ImageUrlPreference(
      original: imageUrl.original,
      thumbnail: imageUrl.thumbnail,
      medium: imageUrl.medium,
      large: imageUrl.large,
    );
  }

  static ImageUrlPreference? fromDomainModelOrNull(ImageUrl? imageUrl) {
    if (imageUrl == null) {
      return null;
    }
    return ImageUrlPreference.fromDomainModel(imageUrl);
  }

  ImageUrl toDomainModel() {
    return ImageUrl(
      original: original,
      thumbnail: thumbnail,
      medium: medium,
      large: large,
    );
  }
}
