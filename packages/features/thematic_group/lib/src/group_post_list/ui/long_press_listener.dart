import 'dart:async';

import 'package:flutter/material.dart';

class LongPressListener extends StatefulWidget {
  final Widget child;
  final Function(Offset) onLongPress;

  const LongPressListener({required this.child, required this.onLongPress, super.key});

  @override
  _LongPressListenerState createState() => _LongPressListenerState();
}

class _LongPressListenerState extends State<LongPressListener> {
  Timer? _longPressTimer;

  void _startTimer(Offset position) {
    _longPressTimer = Timer(const Duration(milliseconds: 200), () {
      widget.onLongPress(position);
    });
  }

  void _cancelTimer() {
    if (_longPressTimer != null) {
      _longPressTimer!.cancel();
      _longPressTimer = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) {
        _startTimer(event.position);
      },
      onPointerUp: (_) {
        _cancelTimer();
      },
      onPointerCancel: (_) {
        _cancelTimer();
      },
      child: widget.child,
    );
  }
}
