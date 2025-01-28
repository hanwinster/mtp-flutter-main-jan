import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:localization/localization.dart';

class MtpOfflineIndicator extends StatefulWidget {
  const MtpOfflineIndicator({super.key});

  @override
  State<MtpOfflineIndicator> createState() => _MtpOfflineIndicatorState();
}

class _MtpOfflineIndicatorState extends State<MtpOfflineIndicator> {
  late StreamSubscription<List<ConnectivityResult>> subscription;
  var _isDeviceConnected = true;
  var _showOnlineStatus = false;
  Timer? _hideStatusTimer;

  void _onConnectivityChanged(List<ConnectivityResult> result) async {
    if (result.contains(ConnectivityResult.none)) {
      setState(() {
        _isDeviceConnected = false;
        _showOnlineStatus = true;
      });
    } else {
      final connected = await InternetConnectionChecker().hasConnection;
        setState(() {
          _isDeviceConnected = connected;
          _showOnlineStatus = true;

          if (connected) {
            _startHideStatusTimer();
          }
        });
    }
  }

  @override
  void initState() {
    super.initState();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) async {
      _onConnectivityChanged(result);
    });
    Connectivity().checkConnectivity().then((result) async {
      if (result.contains(ConnectivityResult.none)) {
        setState(() {
          _isDeviceConnected = false;
          _showOnlineStatus = true;
        });
      } else {
        final connected = await InternetConnectionChecker().hasConnection;
        setState(() {
          _isDeviceConnected = connected;
          _showOnlineStatus = !connected;
        });
      }
    });
  }

  void _startHideStatusTimer() {
    _hideStatusTimer?.cancel();
    _hideStatusTimer = Timer(const Duration(seconds: 3), () {
      setState(() {
        _showOnlineStatus = false;
      });
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    _hideStatusTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_showOnlineStatus) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        Container(
          width: double.infinity,
          color: _isDeviceConnected
              ? context.colorScheme.success
              : context.colorScheme.error,
          padding: const EdgeInsets.symmetric(vertical: Grid.half),
          child: Text(
            textAlign: TextAlign.center,
            _isDeviceConnected
                ? context.l10n.labelNetworkStatusOnline
                : context.l10n.labelNetworkStatusOffline,
            style: context.textTheme.labelSmall?.copyWith(
              color: _isDeviceConnected
                  ? context.colorScheme.onSuccess
                  : context.colorScheme.onError,
            ),
          ),
        ),
        const SizedBox(height: Grid.one),
      ],
    );
  }
}
