import 'dart:collection';

enum TimeUnit { milliseconds, seconds, minutes, hours}

class RateLimiter<KEY> {
  final Map<KEY, int> timestamps = HashMap();
  final int timeout;

  RateLimiter._(this.timeout);

  static RateLimiter<KEY> create<KEY>(int timeout, TimeUnit timeUnit) {
    final calculatedTimeout = _toMilliseconds(timeout, timeUnit);
    return RateLimiter._(calculatedTimeout);
  }

  bool shouldFetch(KEY key) {
    final lastFetched = timestamps[key];
    final now = _now();
    if (lastFetched == null) {
      timestamps[key] = now;
      return true;
    }
    if (now - lastFetched > timeout) {
      timestamps[key] = now;
      return true;
    }
    return false;
  }

  static int _toMilliseconds(int value, TimeUnit timeUnit) {
    switch (timeUnit) {
      case TimeUnit.milliseconds:
        return value;
      case TimeUnit.seconds:
        return value * 1000;
      case TimeUnit.minutes:
        return value * 60 * 1000;
      case TimeUnit.hours:
        return value * 60 * 60 * 1000;
    }
  }

  int _now() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  void reset(KEY key) {
    timestamps.remove(key);
  }
}

