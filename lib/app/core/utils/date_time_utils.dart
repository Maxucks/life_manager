const weekdayNames = [
  "Mon",
  "Tue",
  "Wed",
  "Thu",
  "Fri",
  "Sat",
  "Sun",
];

const monthNames = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December",
];

String monthName(int month) => monthNames[month - 1];

extension DateTimeUtils on DateTime {
  DateTime get firstDayOfWeek => subtract(Duration(days: weekday - 1));

  DateTime get lastDayOfWeek =>
      add(Duration(days: DateTime.daysPerWeek - weekday));

  int get lastDayOfMonth => month < 12
      ? DateTime(year, month + 1, 0).day
      : DateTime(year + 1, 1, 0).day;

  String get weekdayName => weekdayNames[weekday - 1];

  /// Returns the 1th of next month
  DateTime get nextMonth {
    final isDecember = month == 12;

    final mm = isDecember ? 1 : month + 1;
    final yy = isDecember ? year + 1 : year;

    return DateTime(yy, mm, 1);
  }

  /// Returns the 1th of previous month
  DateTime get prevMonth {
    final isJanuary = month == 1;

    final mm = isJanuary ? 12 : month - 1;
    final yy = isJanuary ? year - 1 : year;

    return DateTime(yy, mm, 1);
  }
}
