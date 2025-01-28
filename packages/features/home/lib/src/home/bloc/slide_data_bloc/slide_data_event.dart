part of 'slide_data_bloc.dart';

sealed class SlideDataEvent extends Equatable {
  const SlideDataEvent();
}


final class SlideDataFetch extends SlideDataEvent {
  @override
  List<Object> get props => [];
}