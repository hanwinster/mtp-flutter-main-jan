import 'package:base/base.dart';
import 'package:domain/domain.dart';

class GetSubscriptionTermUseCase {
  GetSubscriptionTermUseCase({
    SubscriptionRepository? subscriptionRepository,
  }) : _subscriptionRepository = subscriptionRepository ?? getIt();

  final SubscriptionRepository _subscriptionRepository;

  Future<SubscriptionTerm> call() {
    return _subscriptionRepository.getSubscriptionTerm();
  }
}
