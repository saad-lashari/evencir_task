class AppDateUtils {
  static int getCurrentWeek(DateTime date) {
    final firstDay = DateTime(date.year, date.month, 1);
    final diff = date.difference(firstDay).inDays;
    return (diff / 7).floor() + 1;
  }

  static int getTotalWeeks(DateTime date) {
    final lastDay = DateTime(date.year, date.month + 1, 0);
    return (lastDay.day / 7).ceil();
  }

  static List<DateTime> getWeekDates(DateTime selectedDate) {
    final start = selectedDate.subtract(
      Duration(days: selectedDate.weekday % 7),
    );
    return List.generate(7, (i) => start.add(Duration(days: i)));
  }

  static bool isDay() {
    final hour = DateTime.now().hour;
    return hour >= 6 && hour < 18;
  }
}