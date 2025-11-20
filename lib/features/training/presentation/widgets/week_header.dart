import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

class WeekHeaderWidget extends StatelessWidget {
  const WeekHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24.h, bottom: 12.h),
      padding: EdgeInsets.only(top: 16.h, bottom: 8.h, left: 24.w, right: 24.w),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.variantBlue, width: 2.w),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Week 2/8', style: Theme.of(context).textTheme.labelSmall),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'December 8-14',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                'Total: 60min',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
