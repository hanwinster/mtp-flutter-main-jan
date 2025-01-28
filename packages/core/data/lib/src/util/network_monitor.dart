/// Utility for reporting app connectivity status.
abstract class NetworkMonitor {
  Stream<bool> get isOnline;
}
