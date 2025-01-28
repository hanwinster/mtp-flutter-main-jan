import 'package:domain/domain.dart';

abstract class SubscriptionRepository {
  Future<SubscriptionTerm> getSubscriptionTerm();
  Future<String> subscribe();
  Future<String> unsubscribe();
}