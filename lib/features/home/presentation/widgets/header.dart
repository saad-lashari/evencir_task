import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';

class HeaderWidget extends StatelessWidget {
  final int currentWeek;
  final int totalWeeks;
  final VoidCallback onCalendarTap;

  const HeaderWidget({
    super.key,
    required this.currentWeek,
    required this.totalWeeks,
    required this.onCalendarTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h, right: 24.w, left: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            AppImages.notificationSvg,
            width: 24.w,
            height: 24.h,
          ),
          GestureDetector(
            onTap: onCalendarTap,
            child: Row(
              children: [
                SvgPicture.asset(AppImages.weekSvg, width: 20.w, height: 20.h),
                SizedBox(width: 4.w),
                Text(
                  'Week $currentWeek/$totalWeeks',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Icon(
                  Icons.arrow_drop_down_sharp,
                  color: AppColors.textTertiary,
                  size: 34.sp,
                ),
              ],
            ),
          ),
          const SizedBox(),
        ],
      ),
    );
  }
}
