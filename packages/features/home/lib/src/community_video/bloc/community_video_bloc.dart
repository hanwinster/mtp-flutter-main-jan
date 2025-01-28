import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'community_video_event.dart';
part 'community_video_state.dart';

class CommunityVideoBloc
    extends Bloc<CommunityVideoEvent, CommunityVideoState> {
  final CommunityVideoListUseCase _communityVideoListUseCase;
  CommunityVideoBloc({
    CommunityVideoListUseCase? communityVideoListUseCase,
  })  : _communityVideoListUseCase = communityVideoListUseCase ?? getIt(),
        super(CommunityVideoInitial()) {

    String type = 'local';
    String? search;
    int page = 1;
    int limit = 10;
    List<CommunityVideoModel> videoList = [];


    on<GetCommunityVideoListEvent>((event, emit) async {
      int timestamp = DateTime.now().millisecondsSinceEpoch;
      try {
        page = 1;
        emit(CommunityVideoLoading());
        videoList = await _communityVideoListUseCase(
          page: page,
          limit: limit,
          type: type,
          search: search,
          isPublished: 1
        );
        emit(CommunityVideoLoaded(videoList, true, timestamp));
      } catch (e) {
        emit(CommunityVideoError(e.toString()));
      }
    });

    on<GetCommunityVideoListLoadMoreEvent>((event, emit) async {
      int timestamp = DateTime.now().millisecondsSinceEpoch;
      try {
        page++;
        List<CommunityVideoModel> videoListMore = await _communityVideoListUseCase(
          page: page,
          limit: limit,
          type: type,
          search: search,
          isPublished: 1
        );
        if(videoListMore.isNotEmpty) {
          videoList.addAll(videoListMore);
          emit(CommunityVideoLoaded(videoList,false, timestamp));
        } else {
          emit(CommunityVideoNoMoreData());
        }

      } catch (e) {
        emit(CommunityVideoError(e.toString()));
      }
    });



    on<ChangeCommunityVideoListTypeEvent>((event, emit) async {
      type = event.type;
      add(GetCommunityVideoListEvent());
      emit(ChangedVideoTypeState(type));
    });

    on<SearchCommunityVideoListEvent>((event, emit) async {
      if(event.search.isEmpty) {
        search = null;
      } else {
        search = event.search;
      }
    });
  }
}
