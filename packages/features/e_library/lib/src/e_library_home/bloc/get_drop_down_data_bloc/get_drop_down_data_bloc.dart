

import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_drop_down_data_event.dart';
part 'get_drop_down_data_state.dart';

class GetDropDownDataBloc extends Bloc<GetDropDownDataEvent, GetDropDownDataState> {
  final GetResourceFormatUseCase _getResourceFormatUseCase;
  final GetSubjectsUseCase _getSubjectsUseCase;
  GetDropDownDataBloc([GetResourceFormatUseCase? getResourceFormatUseCase, GetSubjectsUseCase? getSubjectsUseCase])
      : _getResourceFormatUseCase = getResourceFormatUseCase ?? getIt(), _getSubjectsUseCase = getSubjectsUseCase ?? getIt(), super(GetResourceFormatInitial()) {
    on<GetResourceFormatList>((event, emit) async{
      emit(GetResourceFormatListLoading());
      try {
        final resourceFormatList = await _getResourceFormatUseCase.call();
        emit(GetResourceFormatListLoaded(resourceFormatList));
      } catch (e) {
        emit(GetResourceFormatListError(e.toString()));
      }
    });

    on<GetSubjectList>((event, emit) async{
      emit(GetSubjectListLoading());
      try {
        final subjectList = await _getSubjectsUseCase.call();
        emit(GetSubjectListLoaded(subjectList));
      } catch (e) {
        emit(GetSubjectListError(e.toString()));
      }
    });
  }
}
