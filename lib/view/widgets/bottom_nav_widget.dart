import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monipoint_animated_app/utilities/custom_colors.dart';
import 'package:monipoint_animated_app/view/widgets/round_option_widget.dart';

class BottomNavWidget extends StatefulWidget {
  const BottomNavWidget({
    super.key,
    required this.isSelected,
    required this.activeIconUrl,
    required this.inactiveIconUrl,
    required this.onTap,
  });

  final bool isSelected;
  final String activeIconUrl;
  final String inactiveIconUrl;
  final Function() onTap;

  @override
  State<BottomNavWidget> createState() => _BottomNavWidgetState();
}

class _BottomNavWidgetState extends State<BottomNavWidget> {
  bool isAnimationCompleted = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        color: widget.isSelected && isAnimationCompleted
            ? CustomColors.primary
            : CustomColors.black,
        shape: BoxShape.circle,
      ),
      duration: const Duration(milliseconds: 500),
      child: RoundOptionWidget(
        backgroundColor: Colors.transparent,
        // awaitAnimationBeforeClick: false,
        height: 46.h,
        width: 46.w,
        isActive: widget.isSelected,
        iconUrl: widget.inactiveIconUrl,
        iconUrlActive: widget.activeIconUrl,
        onTap: (){
          setState(() {
            isAnimationCompleted = false;
          });
          widget.onTap.call();
        },
        animationCompletionEvent: (){
          setState(() {
            isAnimationCompleted = true;
          });
        },
      ),
    );
  }
}
