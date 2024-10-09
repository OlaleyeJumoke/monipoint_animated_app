import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monipoint_animated_app/utilities/custom_colors.dart';
import 'package:monipoint_animated_app/utilities/extension.dart';


class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 10.h,
              horizontal: 15.w,
            ),
            decoration: BoxDecoration(
              color: CustomColors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("ic_location".svg)
                    .animate(
                      delay: const Duration(seconds: 1),
                    )
                    .fadeIn(),
                const SizedBox(width: 6),
                Text(
                  "Saint Petersburg",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: CustomColors.greyText,
                  ),
                )
                    .animate(
                      delay: const Duration(seconds: 1),
                    )
                    .fadeIn(),
              ],
            ),
          ).animate().fadeIn().slideX(
                duration: const Duration(seconds: 1),
                curve: Curves.easeIn,
              ),
          const Spacer(),
          Container(
            height: 40.h,
            width: 40.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: CustomColors.primary,
            ),
            child: Image.asset(
              "ic_profile_photo".png,
              fit: BoxFit.scaleDown,
            ),
          ).animate().scale(
                duration: const Duration(seconds: 1),
                curve: Curves.easeIn,
              ),
        ],
      ),
    );
  }
}
