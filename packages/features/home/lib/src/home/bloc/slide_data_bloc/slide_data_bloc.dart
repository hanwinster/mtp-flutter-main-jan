import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

part 'slide_data_event.dart';
part 'slide_data_state.dart';

class SlideDataBloc extends Bloc<SlideDataEvent, SlideDataState> {
  final GetSlideListUseCase _getSlidesUseCase;
  SlideDataBloc([GetSlideListUseCase? getSlidesUseCase]) : _getSlidesUseCase = getSlidesUseCase ?? getIt(), super(SlideDataInitial()) {
    on<SlideDataEvent>((event, emit) {});

    on<SlideDataFetch>((event, emit) async {
      emit(SlideDataLoading());
      try {
        List<SlideModel> slides = await _getSlidesUseCase();
        emit(SlideDataLoaded(slides: slides));
      } catch (e) {
        emit(SlideDataError(error: UiStateFailure.fromError(e)));
      }
    });
  }
}
