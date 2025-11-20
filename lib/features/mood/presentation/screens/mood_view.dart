import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../domain/entities/mood_data.dart';
import '../widgets/mood_wheel.dart';

class MoodScreen extends StatefulWidget {
  const MoodScreen({super.key});

  @override
  State<MoodScreen> createState() => _MoodScreenState();
}

class _MoodScreenState extends State<MoodScreen> {
  String selectedMood = 'calm';

  final Map<String, MoodData> moods = const {
    'content': MoodData(
      label: 'Content',
      color: AppColors.moodEnergetic,
      angle: 0.0,
    ),
    'happy': MoodData(label: 'Happy', color: AppColors.moodHappy, angle: 0.25),
    'calm': MoodData(label: 'Calm', color: AppColors.moodCalm, angle: 0.5),
    'peaceful': MoodData(
      label: 'Peaceful',
      color: AppColors.moodPeaceful,
      angle: 0.75,
    ),
  };

  void _updateSelectedMood(String mood) {
    setState(() {
      selectedMood = mood;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0.0, -1.5),
            radius: 1.6,
            colors: [
              AppColors.gradientColorTeal,
              AppColors.gradientColorBlue,
              AppColors.background,
            ],
            stops: [0.0, 0.3, 0.6],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 36.h),
              _buildHeader(),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 16.h,
                    horizontal: 40.w,
                  ),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Start your day',
                                textAlign: TextAlign.start,
                                style: Theme.of(context).textTheme.labelSmall
                                    ?.copyWith(fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'How are you feeling at the\nMoment?',
                                textAlign: TextAlign.start,
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 22.h),
                          MoodWheelWidget(
                            moods: moods,
                            selectedMood: selectedMood,
                            onMoodChanged: _updateSelectedMood,
                          ),
                          SizedBox(height: 24.h),
                          Text(
                            moods[selectedMood]!.label,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyLarge?.copyWith(fontSize: 28.sp),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.textTertiary,
                      foregroundColor: AppColors.background,
                      padding: EdgeInsets.symmetric(vertical: 12.5.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Text(
                      'Continue',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.background,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 24.w),
        Text('Mood', style: Theme.of(context).textTheme.displayMedium),
      ],
    );
  }
}
