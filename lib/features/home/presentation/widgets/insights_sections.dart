import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';

class InsightsSectionWidget extends StatelessWidget {
  const InsightsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('My Insights', style: Theme.of(context).textTheme.headlineMedium),
        SizedBox(height: 24.h),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 151.56.h,
                padding: EdgeInsets.symmetric(
                  vertical: 13.78.h,
                  horizontal: 13.78.w,
                ),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(6.89.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: '550',
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          TextSpan(
                            text: ' Calories',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 6.h),
                    Text(
                      '1950 Remaining',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '0',
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '2500',
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    LinearProgressIndicator(
                      value: 0.30,
                      minHeight: 7.h,
                      borderRadius: BorderRadius.circular(10.r),
                      backgroundColor: AppColors.textSecondary,
                      color: AppColors.textTernary,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Container(
                height: 151.56.h,
                padding: EdgeInsets.symmetric(
                  vertical: 13.78.h,
                  horizontal: 13.78.w,
                ),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(6.89.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: '75',
                            style: Theme.of(context).textTheme.displayLarge
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                          TextSpan(
                            text: ' kg',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppImages.arrowSvg,
                          width: 18.w,
                          height: 18.h,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          '+ 1.6kg',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      'Weight',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
