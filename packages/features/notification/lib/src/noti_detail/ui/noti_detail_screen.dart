import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification/src/noti_detail/bloc/bloc.dart';
import 'package:ui/ui.dart';
import 'noti_detail_content.dart';
import 'noti_detail_entry.dart';


class NotiDetailScreen extends StatelessWidget {
  const NotiDetailScreen({
    super.key,
    required this.notiId,
    required this.onLaunchNotiEvent,
  });

  final String notiId;
  final LaunchNotiEventHandler onLaunchNotiEvent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.notiLabelNotiListTitle),
        elevation: 0,
        scrolledUnderElevation: 2,
      ),
      body: BlocBuilder<NotiDetailBloc, NotiDetailState>(
        buildWhen: (previous, current) =>
        previous.notiUIstate != current.notiUIstate,
        builder: (context, state) {
          return state.notiUIstate.toView(
            context,
            successViewBuilder: (noti) {
              return NotiDetailContent(
                noti: noti,
                onLaunchNotiEvent: onLaunchNotiEvent,
              );
            },
          );
        },
      ),
    );
  }
}
