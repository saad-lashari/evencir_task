import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../domain/workout_entity.dart';

class WorkoutCardWidget extends StatelessWidget {
  final Workout workout;
  final DateTime? sourceDate;
  final VoidCallback? onDragStarted;

  const WorkoutCardWidget({
    super.key,
    required this.workout,
    this.sourceDate,
    this.onDragStarted,
  });

  @override
  Widget build(BuildContext context) {
    return LongPressDraggable<Workout>(
      data: workout,
      onDragStarted: onDragStarted,
      feedback: Material(
        color: Colors.transparent,
        child: Opacity(opacity: 0.7, child: _buildCard(context)),
      ),
      childWhenDragging: Opacity(opacity: 0.3, child: _buildCard(context)),
      child: _buildCard(context),
    );
  }

  Widget _buildCard(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.only(right: 16.w, left: 8, top: 12.h, bottom: 12.h),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(8.r),
        border: Border(
          left: BorderSide(color: AppColors.textTertiary, width: 7.w),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(AppImages.dragSvg, width: 22.w, height: 22.h),
              SizedBox(width: 8.w),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.w,
                      vertical: 3.h,
                    ),
                    decoration: BoxDecoration(
                      color: workout.color.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(3.r),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          workout.icon,
                          width: 10.w,
                          height: 10.h,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          workout.title,
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(fontSize: 10.sp, color: workout.color),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Padding(
            padding: EdgeInsets.only(left: 38.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  workout.name,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(fontSize: 14.sp),
                ),
                Text(
                  workout.duration,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(fontSize: 14.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
