import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'community_video_detail_event.dart';
part 'community_video_detail_state.dart';

class CommunityVideoDetailBloc
    extends Bloc<CommunityVideoDetailEvent, CommunityVideoDetailState> {
  final CommunityVideoDetailUseCase _communityVideoDetailUseCase;
  final GetRelatedCommunityVideoListUseCase
      _getRelatedCommunityVideoListUseCase;
  CommunityVideoDetailBloc(
      {CommunityVideoDetailUseCase? communityVideoDetailUseCase,
      GetRelatedCommunityVideoListUseCase? getRelatedCommunityVideoListUseCase})
      : _communityVideoDetailUseCase = communityVideoDetailUseCase ?? getIt(),
        _getRelatedCommunityVideoListUseCase =
            getRelatedCommunityVideoListUseCase ?? getIt(),
        super(CommunityVideoDetailInitial()) {
    on<CommunityVideoDetailEvent>((event, emit) {});

    on<GetCommunityVideoDetail>((event, emit) async {
      emit(CommunityVideoDetailLoading());
      try {
        final CommunityVideoModel communityVideoModel =
            await _communityVideoDetailUseCase.call(videoId: event.videoId,viewCount: event.viewCount);
        final List<CommunityVideoModel> relatedCommunityVideoList = await _getRelatedCommunityVideoListUseCase.call(
            videoId: event.videoId, limit: 4, type: communityVideoModel.type, isPublished: 1);
        emit(CommunityVideoDetailSuccess(
            communityVideoModel: communityVideoModel, relatedCommunityVideoList: relatedCommunityVideoList));
      } catch (e) {
        emit(CommunityVideoDetailError());
      }
    });
  }
}
