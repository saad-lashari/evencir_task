import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../calendar/presentation/screens/calendar_view.dart';
import '../widgets/header.dart';
import '../widgets/hydration_section.dart';
import '../widgets/insights_sections.dart';
import '../widgets/week_calendar.dart';
import '../widgets/workout_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now();
  int currentWeek = 1;
  int totalWeeks = 4;
  List<DateTime> weekDates = [];

  @override
  void initState() {
    super.initState();
    _calculateWeekInfo();
    _generateWeekDates();
  }

  void _calculateWeekInfo() {
    final firstDayOfMonth = DateTime(selectedDate.year, selectedDate.month, 1);
    final lastDayOfMonth = DateTime(
      selectedDate.year,
      selectedDate.month + 1,
      0,
    );

    final daysDiff = selectedDate.difference(firstDayOfMonth).inDays;
    currentWeek = (daysDiff / 7).floor() + 1;

    final totalDays = lastDayOfMonth.day;
    totalWeeks = (totalDays / 7).ceil();
  }

  void _generateWeekDates() {
    weekDates.clear();
    final startOfWeek = selectedDate.subtract(
      Duration(days: selectedDate.weekday % 7),
    );
    for (int i = 0; i < 7; i++) {
      weekDates.add(startOfWeek.add(Duration(days: i)));
    }
  }

  void _selectDate(DateTime date) {
    setState(() {
      selectedDate = date;
      _calculateWeekInfo();
      _generateWeekDates();
    });
  }

  void _openCalendar() {
    showModalBottomSheet(
      context: context,
      constraints: BoxConstraints(maxHeight: 500.h),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return CalendarScreen(
          selectedDate: selectedDate,
          onDateSelected: _selectDate,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HeaderWidget(
              currentWeek: currentWeek,
              totalWeeks: totalWeeks,
              onCalendarTap: _openCalendar,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(top: 24.h, right: 24.h, left: 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Today, ${DateFormat('dd MMM yyyy').format(selectedDate)}',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    SizedBox(height: 16.h),
                    WeekCalendarWidget(
                      weekDates: weekDates,
                      selectedDate: selectedDate,
                      onDateSelected: _selectDate,
                    ),
                    SizedBox(height: 24.h),
                    WorkoutsSectionWidget(),
                    SizedBox(height: 32.h),
                    const InsightsSectionWidget(),
                    SizedBox(height: 12.h),
                    const HydrationSectionWidget(),
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
