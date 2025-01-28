part of 'offline_content_bloc.dart';

sealed class OfflineContentState extends Equatable {
  const OfflineContentState();
}

final class OfflineContentInitial extends OfflineContentState {
  @override
  List<Object> get props => [];
}

final class OfflineContentLoading extends OfflineContentState {
  @override
  List<Object> get props => [];
}

final class OfflineContentLoaded extends OfflineContentState {
  const OfflineContentLoaded({
    required this.offlineContent,
  });

  final OfflineContentModel offlineContent;

  @override
  List<Object> get props => [
    offlineContent,
  ];
}

final class OfflineContentError extends OfflineContentState {
  const OfflineContentError({
    required this.error,
  });

  final String error;

  @override
  List<Object> get props => [
    error,
  ];
}