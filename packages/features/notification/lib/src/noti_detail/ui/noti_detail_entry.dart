import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification/src/noti_detail/bloc/bloc.dart';
import 'package:notification/src/noti_detail/ui/noti_detail_screen.dart';

typedef LaunchNotiEventHandler = void Function({
  required String clickActionLink,
});

class NotiDetailScreenEntry extends StatelessWidget {
  const NotiDetailScreenEntry({
    super.key,
    required this.notiId,
    required this.onLaunchNotiEvent,
  });

  final String notiId;
  final LaunchNotiEventHandler onLaunchNotiEvent;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotiDetailBloc(
        notiId: notiId,
      )..add(NotiDetailFetched(notiId)),
      child: NotiDetailScreen(
        notiId: notiId,
        onLaunchNotiEvent: onLaunchNotiEvent,
      ),
    );
  }
}
