import 'package:base/base.dart';
import 'package:domain/domain.dart';

class SubscribeUseCase {
  SubscribeUseCase({
    SubscriptionRepository? subscriptionRepository,
  }) : _subscriptionRepository = subscriptionRepository ?? getIt();

  final SubscriptionRepository _subscriptionRepository;

  Future<String> call() {
    return _subscriptionRepository.subscribe();
  }
}
