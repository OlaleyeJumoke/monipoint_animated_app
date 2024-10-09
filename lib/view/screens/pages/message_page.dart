import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monipoint_animated_app/utilities/custom_colors.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              CustomColors.white,
              CustomColors.primary.withOpacity(0.3),
            ],
            stops: const [0.3, 1],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SizedBox(
            height: 1.sh,
            width: 1.sw,
            child: const Center(
                child: Text(
              'Message',
              textAlign: TextAlign.justify,
            ))),
      ),
    );
  }
}
