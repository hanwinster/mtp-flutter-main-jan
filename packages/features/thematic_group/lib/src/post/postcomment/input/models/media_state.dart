import 'package:formz/formz.dart';
import 'package:ui/ui.dart';

enum PostCommentMediaType {
  image,
  video,
}

typedef MediaValue = ({
  PostCommentMediaType type,
  Uri? uri,
});

class PostCommentMediaState extends FormzInput<MediaValue?, FormFieldValidationError> {
  const PostCommentMediaState.unvalidated([super.value]) : super.pure();

  const PostCommentMediaState.validated([super.value]) : super.dirty();

  @override
  FormFieldValidationError? validator(MediaValue? value) {
    return null;
  }

  factory PostCommentMediaState.newValue(PostCommentMediaState oldState, MediaValue? newValue) {
    return oldState.shouldValidate
        ? PostCommentMediaState.validated(
            newValue,
          )
        : PostCommentMediaState.unvalidated(
            newValue,
          );
  }
}
