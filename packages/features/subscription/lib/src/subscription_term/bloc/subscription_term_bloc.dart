import 'dart:async';

import 'package:base/base.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

part 'subscription_term_event.dart';

part 'subscription_term_state.dart';

class SubscriptionTermBloc
    extends Bloc<SubscriptionTermEvent, SubscriptionTermState> {
  SubscriptionTermBloc({
    GetSubscriptionTermUseCase? getSubscriptionTermUseCase,
    SubscribeUseCase? subscribeUseCase,
  })  : _getSubscriptionTermUseCase = getSubscriptionTermUseCase ?? getIt(),
        _subscribeUseCase = subscribeUseCase ?? getIt(),
        super(SubscriptionTermState.create()) {
    on<SubscriptionTermFetched>(
      _handleSubscriptionTermFetched,
      transformer: restartable(),
    );
    on<SubscriptionTermSubscribed>(
      _handleSubscribed,
    );
  }

  final GetSubscriptionTermUseCase _getSubscriptionTermUseCase;
  final SubscribeUseCase _subscribeUseCase;

  FutureOr<void> _handleSubscriptionTermFetched(
    SubscriptionTermFetched event,
    Emitter<SubscriptionTermState> emit,
  ) async {
    emit(
      state.copyWith(
        subscriptionTermUiState: const UiStateInProgress(),
      ),
    );

    try {
      final subscriptionTerm = await _getSubscriptionTermUseCase();
      emit(
        state.copyWith(
          subscriptionTermUiState: UiStateSuccess(subscriptionTerm),
        ),
      );
    } catch (e, s) {
      logger.e('Failed to fetch subscription term', e, s);
      emit(
        state.copyWith(
          subscriptionTermUiState: UiStateFailure.fromError(e),
        ),
      );
    }
  }

  Future<void> _handleSubscribed(
    SubscriptionTermSubscribed event,
    Emitter<SubscriptionTermState> emit,
  ) async {
    emit(
      state.copyWith(
        subscribeSubmissionUiState: const UiStateInProgress(),
      ),
    );

    try {
      final message = await _subscribeUseCase();
      emit(
        state.copyWith(
          subscribeSubmissionUiState: UiStateSuccess(message),
        ),
      );
    } catch (e, s) {
      logger.e('Failed to subscribe', e, s);
      emit(
        state.copyWith(
          subscribeSubmissionUiState: UiStateFailure.fromError(e),
        ),
      );
    }
  }
}
