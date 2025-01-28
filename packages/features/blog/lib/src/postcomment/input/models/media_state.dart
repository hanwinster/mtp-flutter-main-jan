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

class MediaState extends FormzInput<MediaValue?, FormFieldValidationError> {
  const MediaState.unvalidated([super.value]) : super.pure();

  const MediaState.validated([super.value]) : super.dirty();

  @override
  FormFieldValidationError? validator(MediaValue? value) {
    return null;
  }

  factory MediaState.newValue(MediaState oldState, MediaValue? newValue) {
    return oldState.shouldValidate
        ? MediaState.validated(
            newValue,
          )
        : MediaState.unvalidated(
            newValue,
          );
  }
}
