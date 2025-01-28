import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/edit_profile_bloc.dart';
import 'edit_profile_screen.dart';

typedef UserUpdatedCallback = void Function();

class EditProfileScreenEntry extends StatelessWidget {
  const EditProfileScreenEntry({
    super.key,
    required this.onUserUpdated,
  });

  final UserUpdatedCallback onUserUpdated;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProfileBloc()
        ..add(const EditProfileUserFetched())
        ..add(const EditProfileUserTypesFetched())
        ..add(const EditProfileCollegesFetched())
        ..add(const EditProfileEducationYearsFetched()),
      child: EditProfileScreen(
        onUserUpdated: onUserUpdated,
      ),
    );
  }
}
