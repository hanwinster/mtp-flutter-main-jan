import 'package:base/base.dart';

class UpdateBlogPostCommentErrorResponseRM extends Equatable {
  const UpdateBlogPostCommentErrorResponseRM({
    required this.message,
    required this.textError,
    required this.imageError,
    required this.videoError,
  });

  factory UpdateBlogPostCommentErrorResponseRM.create({
    required String? message,
    required Map<String, String>? errors,
  }) {
    return UpdateBlogPostCommentErrorResponseRM(
      message: message ?? '',
      textError: errors?['description'],
      imageError: errors?['image'],
      videoError: errors?['video'],
    );
  }

  final String message;
  final String? textError;
  final String? imageError;
  final String? videoError;

  @override
  List<Object?> get props => [
        message,
        textError,
        imageError,
        videoError,
      ];
}
