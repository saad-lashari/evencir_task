import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../widgets/calendar_grid.dart';
import '../widgets/month_selector.dart';

class CalendarScreen extends StatefulWidget {
  final Function(DateTime) onDateSelected;
  final DateTime selectedDate;

  const CalendarScreen({
    super.key,
    required this.onDateSelected,
    required this.selectedDate,
  });

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late DateTime currentMonth;

  @override
  void initState() {
    super.initState();
    currentMonth = DateTime(
      widget.selectedDate.year,
      widget.selectedDate.month,
    );
  }

  void _previousMonth() {
    setState(() {
      currentMonth = DateTime(currentMonth.year, currentMonth.month - 1);
    });
  }

  void _nextMonth() {
    setState(() {
      currentMonth = DateTime(currentMonth.year, currentMonth.month + 1);
    });
  }

  void _handleDateSelection(DateTime date) {
    widget.onDateSelected(date);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 16.h),
              child: Stack(
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
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    MonthSelectorWidget(
                      currentMonth: currentMonth,
                      onPreviousMonth: _previousMonth,
                      onNextMonth: _nextMonth,
                    ),
                    CalendarGridWidget(
                      currentMonth: currentMonth,
                      selectedDate: widget.selectedDate,
                      onDateSelected: _handleDateSelection,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
