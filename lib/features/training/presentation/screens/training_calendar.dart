import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../domain/workout_entity.dart';
import '../widgets/dragable_workout.dart';
import '../widgets/week_header.dart';
import '../widgets/week_view_widget.dart';

class TrainingCalendarScreen extends StatefulWidget {
  const TrainingCalendarScreen({super.key});

  @override
  State<TrainingCalendarScreen> createState() => _TrainingCalendarScreenState();
}

class _TrainingCalendarScreenState extends State<TrainingCalendarScreen> {
  Map<DateTime, List<Workout>> workouts = {};

  @override
  void initState() {
    super.initState();
    _initializeSampleWorkouts();
  }

  void _initializeSampleWorkouts() {
    final now = DateTime.now();
    workouts[DateTime(now.year, now.month, 8)] = [
      const Workout(
        icon: AppImages.armWorkOutSvg,
        name: 'Arm Blaster',
        title: 'Arms Workout',
        duration: '25m - 30m',
        color: AppColors.workoutGreen,
      ),
    ];
    workouts[DateTime(now.year, now.month, 11)] = [
      const Workout(
        icon: AppImages.legWorkOutSvg,
        name: 'Leg Day Blitz',
        title: 'Legs Workout',
        duration: '25m - 30m',
        color: AppColors.workoutBlue,
      ),
    ];
  }

  void _addWorkoutToDate(DateTime date, Workout workout) {
    setState(() {
      final normalizedDate = DateTime(date.year, date.month, date.day);
      workouts[normalizedDate] = [...(workouts[normalizedDate] ?? []), workout];
    });
  }

  void _removeWorkoutFromDate(DateTime date, Workout workout) {
    setState(() {
      final normalizedDate = DateTime(date.year, date.month, date.day);
      if (workouts[normalizedDate] != null) {
        workouts[normalizedDate] = workouts[normalizedDate]!
            .where((w) => w != workout)
            .toList();
        if (workouts[normalizedDate]!.isEmpty) {
          workouts.remove(normalizedDate);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 24.w,
                right: 24.w,
                bottom: 16.h,
                top: 24.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Training Calendar',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Save',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                ],
              ),
            ),
            const WeekHeaderWidget(),
            Expanded(
              child: WeekViewWidget(
                workouts: workouts,
                onWorkoutAdded: _addWorkoutToDate,
                onWorkoutRemoved: _removeWorkoutFromDate,
              ),
            ),
            const DraggableWorkoutsWidget(),
          ],
        ),
      ),
    );
  }
}
