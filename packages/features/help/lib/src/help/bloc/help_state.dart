part of 'help_bloc.dart';

class HelpState extends Equatable {
  const HelpState({
    this.cmsMenusUiState = const UiStateInitial(),
  });

  final UiState<List<CmsMenu>> cmsMenusUiState;

  factory HelpState.create() {
    return const HelpState();
  }

  @override
  List<Object> get props => [cmsMenusUiState];

  HelpState copyWith({
    UiState<List<CmsMenu>>? cmsMenusUiState,
  }) {
    return HelpState(
      cmsMenusUiState: cmsMenusUiState ?? this.cmsMenusUiState,
    );
  }
}
