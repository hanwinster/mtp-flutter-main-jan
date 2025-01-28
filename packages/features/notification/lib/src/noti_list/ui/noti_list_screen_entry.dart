import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification/src/noti_list/bloc/noti_list_bloc.dart';
import 'package:notification/src/noti_list/ui/noti_list_screen.dart';

typedef NotiItemEventHandler = void Function({
  required String notiID,
});

class NotiListScreenEntry extends StatelessWidget {
  const NotiListScreenEntry({super.key, required this.onNotiItemEvent});

  final NotiItemEventHandler onNotiItemEvent;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotiListBloc()..add(const NotiListFetched()),
      // create: (context) => ELibraryBloc()..add(ELibraryBooksFetched()),
      child: NotiListScreen(onNotiItemEvent: onNotiItemEvent),
    );
  }
}
