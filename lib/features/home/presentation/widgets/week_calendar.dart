import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/app_colors.dart';

class WeekCalendarWidget extends StatelessWidget {
  final List<DateTime> weekDates;
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;

  const WeekCalendarWidget({
    super.key,
    required this.weekDates,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: weekDates.map((date) {
            final isSelected =
                date.day == selectedDate.day &&
                date.month == selectedDate.month &&
                date.year == selectedDate.year;
            return Column(
              children: [
                Text(
                  DateFormat('E').format(date).substring(0, 2).toUpperCase(),
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                SizedBox(height: 12.h),
                GestureDetector(
                  onTap: () => onDateSelected(date),
                  child: Container(
                    width: 36.w,
                    height: 36.h,
                    decoration: BoxDecoration(
                      color: AppColors.cardBackground,
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
                      '${date.day}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  width: 8.w,
                  height: 8.h,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primary.withValues(alpha: 0.9)
                        : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            );
          }).toList(),
        ),
        SizedBox(height: 16.h),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 55.w,
              height: 5.h,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
