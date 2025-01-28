import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:data/src/util/network_monitor.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectivityPlusNetworkMonitor extends NetworkMonitor {
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  @override
  Stream<bool> get isOnline {
    late StreamController<bool> controller;

    void start() {
      _subscription =
          Connectivity().onConnectivityChanged.listen((result) async {
        if (!result.contains(ConnectivityResult.none)) {
          final hasConnection = await InternetConnectionChecker().hasConnection;
          controller.add(hasConnection);
        } else {
          controller.add(false);
        }
      });
    }

    void stop() {
      _subscription?.cancel();
    }

    controller = StreamController<bool>(
      onListen: start,
      onPause: stop,
      onResume: start,
      onCancel: stop,
    );

    return controller.stream;
  }
}
