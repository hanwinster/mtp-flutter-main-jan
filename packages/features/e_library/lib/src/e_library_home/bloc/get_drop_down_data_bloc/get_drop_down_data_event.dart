part of 'get_drop_down_data_bloc.dart';

sealed class GetDropDownDataEvent extends Equatable {
  const GetDropDownDataEvent();

  @override
  List<Object> get props => [];
}

final class GetResourceFormatList extends GetDropDownDataEvent {}

final class GetSubjectList extends GetDropDownDataEvent {}