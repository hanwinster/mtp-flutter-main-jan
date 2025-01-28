part of 'get_drop_down_data_bloc.dart';

sealed class GetDropDownDataState extends Equatable {
  const GetDropDownDataState();
  @override
  List<Object> get props => [];
}

final class GetResourceFormatInitial extends GetDropDownDataState {}

final class GetResourceFormatListLoaded extends GetDropDownDataState {
  final List<ResourceFormat> resourceFormatList;

  const GetResourceFormatListLoaded(this.resourceFormatList);

  @override
  List<Object> get props => [resourceFormatList];
}

final class GetResourceFormatListLoading extends GetDropDownDataState {}

final class GetResourceFormatListError extends GetDropDownDataState {
  final String message;

  const GetResourceFormatListError(this.message);

  @override
  List<Object> get props => [message];
}

final class GetSubjectListLoaded extends GetDropDownDataState {
  final List<Subject> subjectList;

  const GetSubjectListLoaded(this.subjectList);

  @override
  List<Object> get props => [subjectList];
}

final class GetSubjectListLoading extends GetDropDownDataState {}

final class GetSubjectListError extends GetDropDownDataState {
  final String message;

  const GetSubjectListError(this.message);

  @override
  List<Object> get props => [message];
}