import 'package:base/base.dart';
import 'package:domain/domain.dart';

class UnsubscribeUseCase {
  UnsubscribeUseCase({
    SubscriptionRepository? subscriptionRepository,
  }) : _subscriptionRepository = subscriptionRepository ?? getIt();

  final SubscriptionRepository _subscriptionRepository;

  Future<String> call() {
    return _subscriptionRepository.unsubscribe();
  }
}
