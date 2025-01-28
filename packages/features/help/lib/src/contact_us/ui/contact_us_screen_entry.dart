import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/contact_us_bloc.dart';
import 'contact_us_screen.dart';

class ContactUsScreenEntry extends StatelessWidget {
  const ContactUsScreenEntry({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactUsBloc()
        ..add(const ContactUsContactInfoFetched())
        ..add(const ContactUsContactRegionsFetched()),
      child: const ContactUsScreen(),
    );
  }
}
