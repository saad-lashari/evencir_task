import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evencir_task/features/training/presentation/widgets/workout_card.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../domain/workout_entity.dart';

class DraggableWorkoutsWidget extends StatelessWidget {
  const DraggableWorkoutsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final availableWorkouts = [
      const Workout(
        icon: AppImages.armWorkOutSvg,
        name: 'Arm Blaster',
        title: 'Arms Workout',
        duration: '25m - 30m',
        color: AppColors.workoutGreen,
      ),
      const Workout(
        icon: AppImages.legWorkOutSvg,
        name: 'Leg Day Blitz',
        title: 'Legs Workout',
        duration: '25m - 30m',
        color: AppColors.workoutBlue,
      ),
    ];

    return Container(
      height: 200.h,
      padding: EdgeInsets.only(top: 16.h, left: 24.w, right: 24.w),
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border(
          top: BorderSide(color: AppColors.primary, width: 2.w),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Workouts', style: Theme.of(context).textTheme.labelSmall),
            SizedBox(height: 12.h),
            ...availableWorkouts.map((workout) {
              return LongPressDraggable<Workout>(
                data: workout,
                feedback: Material(
                  color: Colors.transparent,
                  child: SizedBox(
                    width: 300.w,
                    child: Opacity(
                      opacity: 0.7,
                      child: WorkoutCardWidget(workout: workout),
                    ),
                  ),
                ),
                childWhenDragging: Opacity(
                  opacity: 0.3,
                  child: WorkoutCardWidget(workout: workout),
                ),
                child: WorkoutCardWidget(workout: workout),
              );
            }),
          ],
        ),
      ),
    );
  }
}
