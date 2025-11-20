import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:evencir_task/features/training/presentation/widgets/workout_card.dart';

import '../../../../core/constants/app_colors.dart';
import '../../domain/workout_entity.dart';

class WeekViewWidget extends StatelessWidget {
  final Map<DateTime, List<Workout>> workouts;
  final Function(DateTime, Workout) onWorkoutAdded;
  final Function(DateTime, Workout) onWorkoutRemoved;

  const WeekViewWidget({
    super.key,
    required this.workouts,
    required this.onWorkoutAdded,
    required this.onWorkoutRemoved,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday % 7));

    return ListView.builder(
      itemCount: 7,
      itemBuilder: (context, index) {
        final date = startOfWeek.add(Duration(days: index));
        final normalizedDate = DateTime(date.year, date.month, date.day);
        final dayWorkouts = workouts[normalizedDate] ?? [];

        return DragTarget<Workout>(
          onAcceptWithDetails: (workout) => onWorkoutAdded(date, workout.data),
          builder: (context, candidateData, rejectedData) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white.withValues(alpha: 0.1),
                  ),
                ),
                color: candidateData.isNotEmpty
                    ? Colors.white.withValues(alpha: 0.05)
                    : null,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 32.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat('E').format(date),
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                color: dayWorkouts.isEmpty
                                    ? AppColors.textTertiary.withValues(
                                        alpha: 0.3,
                                      )
                                    : AppColors.textTertiary,
                              ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          '${date.day}',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                fontSize: 20,
                                color: dayWorkouts.isEmpty
                                    ? AppColors.textTertiary.withValues(
                                        alpha: 0.3,
                                      )
                                    : AppColors.textTertiary,
                              ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      children: dayWorkouts.map((workout) {
                        return WorkoutCardWidget(
                          workout: workout,
                          sourceDate: date,
                          onDragStarted: () => onWorkoutRemoved(date, workout),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
