import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class AccountView extends StatelessWidget {
  final String? image;
  final String? name,info;
  const AccountView({super.key, this.image,required this.name,this.info});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: (image != null && image!.isNotEmpty)?NetworkImage(image!):const NetworkImage("https://img.freepik.com/premium-vector/customizable-flat-vector-user-avatar-trendy-style-premium-icon_142112-12263.jpg?w=1060"), // User profile image
        ),
        const SizedBox(width: 10,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              name!=null?Text(name!,style: context.textTheme.titleSmall,):const SizedBox(),
              info!=null?Text(info!,style: context.textTheme.bodySmall):const SizedBox()
            ],
          ),
        )
      ],
    );
  }
}
