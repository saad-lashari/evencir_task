import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import 'hydration_level_graph.dart';

class HydrationSectionWidget extends StatelessWidget {
  const HydrationSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 13.78.h,
              left: 13.78.w,
              right: 13.78.w,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '0%',
                        style: Theme.of(context).textTheme.displayLarge
                            ?.copyWith(color: AppColors.variantBlue),
                      ),
                      SizedBox(height: 43.h),
                      Text(
                        'Hydration',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Log Now',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textVariantSecondary,
                        ),
                      ),
                      SizedBox(height: 13.78.h),
                    ],
                  ),
                ),
                Column(
                  children: [
                    HydrationGraphWidget(totalDots: 10, activeDot: 2),
                    SizedBox(height: 13.78.h),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 13.78.h),
            decoration: BoxDecoration(
              color: AppColors.variantGreen,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.r),
                bottomRight: Radius.circular(8.r),
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              '500 ml added to water log',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
