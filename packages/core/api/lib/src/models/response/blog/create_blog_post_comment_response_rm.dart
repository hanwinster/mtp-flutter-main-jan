import 'package:base/base.dart';

class CreateBlogPostCommentErrorResponseRM extends Equatable {
  const CreateBlogPostCommentErrorResponseRM({
    required this.message,
    required this.textError,
    required this.imageError,
    required this.videoError,
  });

  factory CreateBlogPostCommentErrorResponseRM.create({
    required String? message,
    required Map<String, String>? errors,
  }) {
    return CreateBlogPostCommentErrorResponseRM(
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
