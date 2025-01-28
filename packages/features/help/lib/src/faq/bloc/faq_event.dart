part of 'faq_bloc.dart';

sealed class FaqEvent extends Equatable {
  const FaqEvent();
}

class FaqFetched extends FaqEvent {
  const FaqFetched();

  @override
  List<Object> get props => [];
}
