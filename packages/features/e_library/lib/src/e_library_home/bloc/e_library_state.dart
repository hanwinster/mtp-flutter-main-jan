part of 'e_library_bloc.dart';

sealed class ELibraryState extends Equatable {
  const ELibraryState();
}

final class ELibraryInitial extends ELibraryState {
  @override
  List<Object> get props => [];
}

final class ELibraryLoading extends ELibraryState {
  @override
  List<Object> get props => [];
}

final class ELibraryLoaded extends ELibraryState {
  final List<Resource> resources;
  final bool isFirstLoadRunning;
  final int timestamp;

  const ELibraryLoaded({required this.resources, required this.isFirstLoadRunning,required this.timestamp});

  @override
  List<Object> get props => [resources, isFirstLoadRunning, timestamp];
}

final class ELibraryNoMoreData extends ELibraryState {
  @override
  List<Object> get props => [];
}

final class ELibraryError extends ELibraryState {
  final String message;

  const ELibraryError(this.message);

  @override
  List<Object> get props => [message];
}