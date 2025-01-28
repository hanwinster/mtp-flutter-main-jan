import 'dart:async';

import 'package:base/base.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

part 'faq_event.dart';

part 'faq_state.dart';

class FaqBloc extends Bloc<FaqEvent, FaqState> {
  FaqBloc({
    GetFaqsUseCase? observeSampleUseCase,
  })  : _observeSampleUseCase = observeSampleUseCase ?? getIt(),
        super(FaqState.create()) {
    on<FaqFetched>(
      _handleFaqsFetched,
      transformer: restartable(),
    );
  }

  final GetFaqsUseCase _observeSampleUseCase;

  FutureOr<void> _handleFaqsFetched(
    FaqFetched event,
    Emitter<FaqState> emit,
  ) async {
    emit(
      state.copyWith(
        faqsUiState: const UiStateInProgress(),
      ),
    );

    try {
      final faqs = await _observeSampleUseCase();
      emit(
        state.copyWith(
          faqsUiState: UiStateSuccess(faqs),
        ),
      );
    } catch (e, s) {
      logger.e('Error fetching faqs', e, s);
      emit(
        state.copyWith(
          faqsUiState: UiStateFailure.fromError(e),
        ),
      );
    }
  }
}
