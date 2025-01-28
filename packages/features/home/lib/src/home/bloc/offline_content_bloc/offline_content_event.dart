part of 'offline_content_bloc.dart';

sealed class OfflineContentEvent extends Equatable {
  const OfflineContentEvent();
}

final class OfflineContentFetched extends OfflineContentEvent {
  const OfflineContentFetched();

  @override
  List<Object> get props => [];
}