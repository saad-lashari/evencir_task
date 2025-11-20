import 'package:flutter/material.dart';
import 'package:evencir_task/core/constants/app_images.dart';
import 'package:evencir_task/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:evencir_task/features/dashboard/presentation/cubit/dashboard_state.dart';
import 'package:evencir_task/features/dashboard/presentation/widgets/nav_item.dart';
import 'package:evencir_task/features/home/presentation/screens/home_view.dart';
import 'package:evencir_task/features/mood/presentation/screens/mood_view.dart';
import 'package:evencir_task/features/training/presentation/screens/training_calendar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Assuming you have imported your Cubit and State classes,
// as well as the necessary placeholder screen widgets (HomeScreen, etc.)
// and NavItem widget, and AppImages.

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  // Define the list of screens outside the build method or as a static member
  final List<Widget> screens = const [
    // Placeholder screens from your original code
    HomeScreen(),
    TrainingCalendarScreen(),
    MoodScreen(),
    Text('Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    // Get the Cubit instance to call methods
    final cubit = context.read<DashboardCubit>();

    return Scaffold(
      // Use BlocBuilder to rebuild the body when the currentIndex changes
      body: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          return Center(child: screens[state.currentIndex]);
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: BlocBuilder<DashboardCubit, DashboardState>(
            buildWhen: (previous, current) =>
                previous.currentIndex != current.currentIndex,
            builder: (context, state) {
              final currentIndex = state.currentIndex;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 1. Nutrition
                  NavItem(
                    // Replace AppImages.nutritionSvg with a simple Icon for this example
                    icon: AppImages.nutritionSvg,
                    label: 'Nutrition',
                    index: 0,
                    currentIndex: currentIndex,
                    onTap: () => cubit.navigateToScreen(0),
                  ),

                  // 2. Plan
                  NavItem(
                    icon: AppImages.calendarSvg,
                    label: 'Plan',
                    index: 1,
                    currentIndex: currentIndex,
                    onTap: () => cubit.navigateToScreen(1),
                  ),

                  // 3. Mood
                  NavItem(
                    icon: AppImages.moodSvg,
                    label: 'Mood',
                    index: 2,
                    currentIndex: currentIndex,
                    onTap: () => cubit.navigateToScreen(2),
                  ),

                  // 4. Profile
                  NavItem(
                    icon: AppImages.profileSvg,
                    label: 'Profile',
                    index: 3,
                    currentIndex: currentIndex,
                    onTap: () => cubit.navigateToScreen(3),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
