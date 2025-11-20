import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

class HydrationGraphWidget extends StatelessWidget {
  final int totalDots;
  final int activeDot;

  const HydrationGraphWidget({
    super.key,
    this.totalDots = 5,
    this.activeDot = 2,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 176.56.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              Column(
                children: [
                  Column(
                    children: List.generate(totalDots, (index) {
                      final reversed = totalDots - 1 - index;
                      final isActive = reversed == activeDot;
                      final isFirst = reversed == totalDots - 1;
                      final isLast = reversed == 0;
                      final shouldHighlight = isActive || isFirst || isLast;

                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        child: Row(
                          children: [
                            if (isFirst || isLast)
                              Padding(
                                padding: EdgeInsets.only(right: 4.w),
                                child: Text(
                                  isFirst ? "2 L" : "0 L",
                                  style: Theme.of(context).textTheme.bodySmall
                                      ?.copyWith(fontWeight: FontWeight.w600),
                                ),
                              )
                            else
                              SizedBox(width: 20.w),
                            // Dot
                            Container(
                              width: 8.w,
                              height: 4.h,
                              decoration: BoxDecoration(
                                color: shouldHighlight
                                    ? AppColors.variantBlue
                                    : AppColors.variantBlue.withValues(
                                        alpha: 0.4,
                                      ),
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                            ),

                            if (isLast)
                              Row(
                                children: [
                                  Container(
                                    width: 107.4.w,
                                    height: 1.h,
                                    margin: EdgeInsets.only(left: 2.w),
                                    decoration: BoxDecoration(
                                      color: AppColors.textTertiary,
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Text(
                                    "0ml",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
