import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:monipoint_animated_app/data_bank/places.dart';
import 'package:monipoint_animated_app/utilities/custom_colors.dart';
import 'package:monipoint_animated_app/utilities/extension.dart';
import 'package:monipoint_animated_app/view/widgets/home_header_widget.dart';
import 'package:monipoint_animated_app/view/widgets/offer_widget.dart';
import 'package:monipoint_animated_app/view/widgets/place_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              CustomColors.backGroundWhite1,
              CustomColors.primary.withOpacity(0.3),
            ],
            stops: const [0.3, 1],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const HomeHeaderWidget(),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "Hi, Marina",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: CustomColors.greyText,
                  ),
                )
                    .animate(
                      delay: const Duration(milliseconds: 300),
                    )
                    .fadeIn(),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "let's select your\nperfect place",
                  style: TextStyle(
                    color: CustomColors.black,
                    fontSize: 27.sp,
                    height: 1.2,
                  ),
                )
                    .animate(
                      delay: const Duration(milliseconds: 300),
                    )
                    .slideY(
                      begin: 1,
                      end: 0,
                      curve: Curves.easeIn,
                      duration: const Duration(milliseconds: 700),
                    )
                    .fadeIn(
                      duration: const Duration(seconds: 1),
                    ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: OfferWidget(
                        title: "BUY",
                        height: 140.h,
                        amount: 1034,
                        titleColor: CustomColors.white,
                        decoration: BoxDecoration(
                          color: CustomColors.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    const SizedBox(width: 30),
                    Expanded(
                      child: OfferWidget(
                        title: "RENT",
                        height: 140.h,
                        amount: 2212,
                        titleColor: CustomColors.greyText,
                        decoration: BoxDecoration(
                          color: CustomColors.primary,
                          borderRadius: BorderRadius.circular(24),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              CustomColors.white.withOpacity(0.4),
                              CustomColors.white.withOpacity(0.9),
                            ],
                            stops: const [
                              -1,
                              0.5,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: DraggableScrollableSheet(
        initialChildSize: 0.45,
        maxChildSize: 0.8,
        minChildSize: 0.45,
        builder: (context, controller) {
          return Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: GridView.custom(
              controller: controller,
              physics: const ClampingScrollPhysics(),
              gridDelegate: SliverQuiltedGridDelegate(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                repeatPattern: QuiltedGridRepeatPattern.same,
                pattern: [
                  const QuiltedGridTile(1, 2),
                  const QuiltedGridTile(2, 1),
                  const QuiltedGridTile(1, 1),
                  const QuiltedGridTile(1, 1),
                ],
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                (context, index) => PlaceWidget(
                  image: PlacesData.allPlaces[index]["imgUrl"].toString().png,
                  isFullView: bool.parse(
                      PlacesData.allPlaces[index]["isFullView"].toString()),
                  title: PlacesData.allPlaces[index]["title"].toString(),
                ),
                childCount: PlacesData.allPlaces.length,
              ),
            ),
          );
        },
      ).animate().slideY(
            duration: const Duration(seconds: 1) * 1.4,
            curve: Curves.easeOut,
            begin: 1,
            end: 0,
          ),
    );
  }
}
