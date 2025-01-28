part of 'help_bloc.dart';

sealed class HelpEvent extends Equatable {
  const HelpEvent();
}

class HelpCmsMenusFetched extends HelpEvent {
  const HelpCmsMenusFetched();

  @override
  List<Object> get props => [];
}
