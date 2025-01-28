import 'package:base/base.dart';

enum LoadType {
  refresh,
  append,
}

sealed class LoadState extends Equatable {
  const LoadState({
    this.endOfPaginationReached = false,
  });

  final bool endOfPaginationReached;

  @override
  List<Object> get props => [endOfPaginationReached];
}

class LoadStateNotLoading extends LoadState {
  const LoadStateNotLoading({super.endOfPaginationReached});

  factory LoadStateNotLoading.complete() =>
      const LoadStateNotLoading(
        endOfPaginationReached: true,
      );

  factory LoadStateNotLoading.incomplete() =>
      const LoadStateNotLoading(
        endOfPaginationReached: false,
      );
}

class LoadStateLoading extends LoadState {
  const LoadStateLoading() : super(endOfPaginationReached: false);
}

class LoadStateError extends LoadState {
  const LoadStateError({
    required this.exception,
  }) : super(endOfPaginationReached: false);

  final Exception exception;

  @override
  List<Object> get props => super.props..addAll([exception]);
}


class LoadStates extends Equatable {
  const LoadStates({
    required this.refresh,
    required this.append,
  });

  final LoadState refresh;
  final LoadState append;

  bool get hasError => refresh is LoadStateError || append is LoadStateError;

  bool get isIdle =>
      refresh is LoadStateNotLoading && append is LoadStateNotLoading;

  factory LoadStates.idle() =>
      LoadStates(
        refresh: LoadStateNotLoading.incomplete(),
        append: LoadStateNotLoading.incomplete(),
      );

  @override
  List<Object> get props => [refresh, append];
}