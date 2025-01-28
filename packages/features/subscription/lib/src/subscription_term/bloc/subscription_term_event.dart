part of 'subscription_term_bloc.dart';

sealed class SubscriptionTermEvent extends Equatable {
  const SubscriptionTermEvent();
}

class SubscriptionTermFetched extends SubscriptionTermEvent {
  const SubscriptionTermFetched();

  @override
  List<Object> get props => [];
}

class SubscriptionTermSubscribed extends SubscriptionTermEvent {
  const SubscriptionTermSubscribed();

  @override
  List<Object> get props => [];
}