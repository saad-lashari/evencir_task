import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

class CalendarGridWidget extends StatelessWidget {
  final DateTime currentMonth;
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;

  const CalendarGridWidget({
    super.key,
    required this.currentMonth,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    final firstDayOfMonth = DateTime(currentMonth.year, currentMonth.month, 1);
    final lastDayOfMonth = DateTime(
      currentMonth.year,
      currentMonth.month + 1,
      0,
    );
    final daysInMonth = lastDayOfMonth.day;
    final firstWeekday = firstDayOfMonth.weekday % 7;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN']
                .map(
                  (day) => SizedBox(
                    width: 40,
                    child: Text(
                      day,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                )
                .toList(),
          ),
          SizedBox(height: 16.h),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1,
            ),
            itemCount: firstWeekday + daysInMonth,
            itemBuilder: (context, index) {
              if (index < firstWeekday) {
                return const SizedBox();
              }
              final day = index - firstWeekday + 1;
              final date = DateTime(currentMonth.year, currentMonth.month, day);
              final isSelected =
                  date.day == selectedDate.day &&
                  date.month == selectedDate.month &&
                  date.year == selectedDate.year;

              return GestureDetector(
                onTap: () => onDateSelected(date),
                child: Container(
                  margin: EdgeInsets.all(4.sp),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.variantGreen.withValues(alpha: 0.1)
                        : AppColors.cardBackground,
                    shape: BoxShape.circle,
                    border: isSelected
                        ? Border.all(
                            color: AppColors.primary.withValues(alpha: 0.9),
                            width: 2.w,
                          )
                        : Border.all(color: AppColors.cardBackground),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '$day',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
