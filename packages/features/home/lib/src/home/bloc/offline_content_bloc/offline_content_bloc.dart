import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'offline_content_event.dart';
part 'offline_content_state.dart';

class OfflineContentBloc extends Bloc<OfflineContentEvent, OfflineContentState> {
  final GetOfflineContentUseCase _getOfflineContentUseCase;
  OfflineContentBloc([GetOfflineContentUseCase? getOfflineContentUseCase]) : _getOfflineContentUseCase = getOfflineContentUseCase ?? getIt(), super(OfflineContentInitial()) {
    on<OfflineContentFetched>((event, emit) async{
      emit(OfflineContentLoading());
      try {
        OfflineContentModel offlineContent = await _getOfflineContentUseCase();
        emit(OfflineContentLoaded(offlineContent: offlineContent));
      }  catch (e) {
        emit(OfflineContentError(error: e.toString()));
      }
    });
  }
}
