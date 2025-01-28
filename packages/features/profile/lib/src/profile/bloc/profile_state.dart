part of 'profile_bloc.dart';

final class ProfileState extends Equatable {
  const ProfileState({
    this.userUiState = const UiStateInitial(),
  });

  final UiState<User?> userUiState;

  factory ProfileState.create() {
    return const ProfileState();
  }

  @override
  List<Object> get props => [
        userUiState,
      ];

  UserType? get userType => userUiState.dataOrNull?.userType;

  bool get shouldShowCollege => userType == UserType.studentTeacher;

  bool get shouldShowEducationYear => userType == UserType.studentTeacher;

  bool get shouldShowOrganization =>
      userType == UserType.independentLearner ||
      userType == UserType.independentTeacher;

  bool get shouldShowAffiliation => userType == UserType.journalist;

  bool get shouldShowPosition => userType == UserType.journalist;

  bool get isEditable =>
      userType == UserType.independentLearner ||
      userType == UserType.studentTeacher ||
      userType == UserType.independentTeacher ||
      userType == UserType.journalist;

  ProfileState copyWith({
    UiState<User?>? userUiState,
  }) {
    return ProfileState(
      userUiState: userUiState ?? this.userUiState,
    );
  }
}
