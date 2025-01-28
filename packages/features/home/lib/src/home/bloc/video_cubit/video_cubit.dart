import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  final GetHomePageVideoUseCase _getHomePageVideoUseCase;
  VideoCubit([GetHomePageVideoUseCase? getHomePageVideoUseCase]) : _getHomePageVideoUseCase = getHomePageVideoUseCase ?? getIt(), super(VideoInitial());

  void getVideoLink() async {
    emit(VideoLoading());
    try {
      HomePageVideoModel video = await _getHomePageVideoUseCase();
      emit(VideoLoaded(video: video));
    } catch (e) {
      emit(VideoError(message: e.toString()));
    }
  }
}
