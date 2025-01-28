import 'dart:async';

import 'package:base/base.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/models.dart';

part 'timer_event.dart';

part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final Ticker _ticker;
  StreamSubscription<int>? _tickerSubscription;

  TimerBloc({
    Ticker? ticker,
  })  : _ticker = ticker ?? const Ticker(),
        super(const TimerInitial(0)) {
    on<TimerStarted>(_handleTimerStarted);
    on<TimerTicked>(_handleTimerTicked);
    on<TimerPaused>(_handleTimerPaused);
    on<TimerResumed>(_handleTimerResumed);
    on<TimerReset>(_handleTimerReset);
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  FutureOr<void> _handleTimerStarted(
    TimerStarted event,
    Emitter<TimerState> emit,
  ) {
    emit(TimerRunInProgress(event.duration));
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker
        .tick(ticks: event.duration)
        .listen((duration) => add(TimerTicked(duration: duration)));
  }

  FutureOr<void> _handleTimerTicked(
    TimerTicked event,
    Emitter<TimerState> emit,
  ) {
    emit(
      event.duration > 0
          ? TimerRunInProgress(event.duration)
          : const TimerRunComplete(),
    );
  }

  FutureOr<void> _handleTimerPaused(
    TimerPaused event,
    Emitter<TimerState> emit,
  ) {
    if (state is TimerRunInProgress) {
      _tickerSubscription?.pause();
      emit(TimerRunPause(state.duration));
    }
  }

  FutureOr<void> _handleTimerResumed(
    TimerResumed event,
    Emitter<TimerState> emit,
  ) {
    if (state is TimerRunPause) {
      _tickerSubscription?.resume();
      emit(TimerRunInProgress(state.duration));
    }
  }

  FutureOr<void> _handleTimerReset(
    TimerReset event,
    Emitter<TimerState> emit,
  ) {
    _tickerSubscription?.cancel();
    emit(TimerInitial(event.duration));
  }
}
