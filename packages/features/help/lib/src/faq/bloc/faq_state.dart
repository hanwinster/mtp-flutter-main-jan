part of 'faq_bloc.dart';

final class FaqState extends Equatable {
  const FaqState({
    this.faqsUiState = const UiStateInitial(),
  });

  final UiState<List<Faq>> faqsUiState;

  factory FaqState.create() {
    return const FaqState();
  }

  @override
  List<Object> get props => [faqsUiState];

  FaqState copyWith({
    UiState<List<Faq>>? faqsUiState,
  }) {
    return FaqState(
      faqsUiState: faqsUiState ?? this.faqsUiState,
    );
  }
}