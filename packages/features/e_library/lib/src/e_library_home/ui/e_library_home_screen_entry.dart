import 'package:domain/domain.dart';
import 'package:e_library/src/e_library_home/bloc/e_library_bloc.dart';
import 'package:e_library/src/e_library_home/bloc/get_drop_down_data_bloc/get_drop_down_data_bloc.dart';
import 'package:e_library/src/e_library_home/cubit/e_library_resource_format_change_cubit.dart';
import 'package:e_library/src/e_library_home/cubit/e_library_subject_change_cubit.dart';
import 'package:e_library/src/e_library_home/ui/e_library_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

typedef OnResourceTapped = void Function(Resource resource);

class ELibraryHomeScreenEntry extends StatelessWidget {
  const ELibraryHomeScreenEntry({
    super.key,
    required this.drawer,
    required this.scaffoldKey,
    required this.onResourceTapped,
    required this.onNotiClick,
  });

  final Widget drawer;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final OnResourceTapped onResourceTapped;
  final NotificationActionClickCallback onNotiClick;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ELibraryBloc()
            ..add(const GetELibraryBooks(
                query: '', subject: '', resourceFormat: '')),
        ),
        BlocProvider(
          create: (context) => GetDropDownDataBloc()
            ..add(GetResourceFormatList())
            ..add(GetSubjectList()),
        ),
        BlocProvider(
          create: (context) => ELibraryResourceFormatChangeCubit(),
        ),
        BlocProvider(
          create: (context) => ELibrarySubjectChangeCubit(),
        )
      ],
      child: ELibraryHomeScreen(
        drawer: drawer,
        scaffoldKey: scaffoldKey,
        onResourceTapped: onResourceTapped,
        onNotiClick: onNotiClick,
      ),
    );
  }
}
