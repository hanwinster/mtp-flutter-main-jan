import 'package:base/base.dart';

class ImageUrl extends Equatable {
  const ImageUrl({
    required this.original,
    required this.thumbnail,
    required this.medium,
    required this.large,
  });

  final String original;
  final String thumbnail;
  final String medium;
  final String large;

  @override
  List<Object> get props => [
        original,
        thumbnail,
        medium,
        large,
      ];

  factory ImageUrl.empty() {
    return const ImageUrl(
      original: '',
      thumbnail: '',
      medium: '',
      large: '',
    );
  }

  bool get isEmpty =>
      original.isEmpty &&
      thumbnail.isEmpty &&
      medium.isEmpty &&
      large.isEmpty;

  bool get isNotEmpty => !isEmpty;
}
