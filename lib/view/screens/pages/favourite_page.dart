import 'package:flutter/material.dart';
import 'package:monipoint_animated_app/utilities/custom_colors.dart';


class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}