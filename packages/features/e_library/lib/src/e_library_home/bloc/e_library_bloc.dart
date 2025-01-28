import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'e_library_event.dart';
part 'e_library_state.dart';

class ELibraryBloc extends Bloc<ELibraryEvent, ELibraryState> {
  final GetResourcesUseCase _getResourcesUseCase;
  ELibraryBloc([GetResourcesUseCase? getResourceUseCase])
      : _getResourcesUseCase = getResourceUseCase ?? getIt(),
        super(ELibraryInitial()) {
    on<ELibraryEvent>((event, emit) {});

    int page = 1;
    int limit = 20;
    List<Resource> resourceList = [];

    on<GetELibraryBooks>((event, emit) async {
      emit(ELibraryLoading());
      try {
        int timeStamp = DateTime.now().microsecondsSinceEpoch;
        String? subject = event.subject.isNotEmpty ? event.subject : null;
        String? resourceFormat = event.resourceFormat.isNotEmpty ? event.resourceFormat : null;
        String? query = event.query.isNotEmpty ? event.query : null;

        resourceList = await _getResourcesUseCase.call(
            page: 1,
            limit: limit,
            query: query,
            subject: subject,
            resourceFormat: resourceFormat);
        emit(ELibraryLoaded(resources: resourceList, isFirstLoadRunning: true, timestamp: timeStamp));
      } catch (e) {
        emit(ELibraryError(e.toString()));
      }
    });

    on<GetELibraryBooksLoadMore>((event, emit) async {
      page++;
      try {
        int timeStamp = DateTime.now().microsecondsSinceEpoch;
        String? subject = event.subject.isNotEmpty ? event.subject : null;
        String? resourceFormat = event.resourceFormat.isNotEmpty ? event.resourceFormat : null;
        String? query = event.query.isNotEmpty ? event.query : null;

        List<Resource> resources = await _getResourcesUseCase.call(
            page: page,
            limit: limit,
            query: query,
            subject: subject,
            resourceFormat: resourceFormat);
        if (resources.isNotEmpty) {
          resourceList.addAll(resources);
          emit(ELibraryLoaded(
              resources: resourceList, isFirstLoadRunning: false, timestamp: timeStamp));
        } else {
          emit(ELibraryNoMoreData());
        }
      } catch (e) {
        emit(ELibraryError(e.toString()));
      }
    });
  }
}
