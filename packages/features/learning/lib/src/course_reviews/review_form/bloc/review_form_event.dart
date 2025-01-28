part of 'review_form_bloc.dart';

sealed class ReviewFormEvent extends Equatable {
  const ReviewFormEvent();
}

class ReviewFormRatingChanged extends ReviewFormEvent {
  const ReviewFormRatingChanged(this.rating,);

  final int rating;

  @override
  List<Object> get props => [rating];
}

class ReviewFormRemarkChanged extends ReviewFormEvent {
  const ReviewFormRemarkChanged(this.remark,);

  final String remark;

  @override
  List<Object> get props => [remark];
}

class ReviewFormSubmitted extends ReviewFormEvent {
  const ReviewFormSubmitted();

  @override
  List<Object> get props => [];
}