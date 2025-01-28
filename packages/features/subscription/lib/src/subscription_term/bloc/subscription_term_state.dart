part of 'subscription_term_bloc.dart';

final class SubscriptionTermState extends Equatable {
  const SubscriptionTermState({
    this.subscriptionTermUiState = const UiStateInitial(),
    this.subscribeSubmissionUiState = const UiStateInitial(),
  });

  final UiState<SubscriptionTerm> subscriptionTermUiState;
  final UiState<String> subscribeSubmissionUiState;

  factory SubscriptionTermState.create() {
    return SubscriptionTermState();
  }

  @override
  List<Object> get props => [
        subscriptionTermUiState,
        subscribeSubmissionUiState,
      ];

  SubscriptionTermState copyWith({
    UiState<SubscriptionTerm>? subscriptionTermUiState,
    UiState<String>? subscribeSubmissionUiState,
  }) {
    return SubscriptionTermState(
      subscriptionTermUiState:
          subscriptionTermUiState ?? this.subscriptionTermUiState,
      subscribeSubmissionUiState:
          subscribeSubmissionUiState ?? this.subscribeSubmissionUiState,
    );
  }
}
