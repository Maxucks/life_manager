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

extension DateTimeUtils on DateTime {
  DateTime get firstDayOfWeek => subtract(Duration(days: weekday - 1));

  DateTime get lastDayOfWeek =>
      add(Duration(days: DateTime.daysPerWeek - weekday));

  int get lastDayOfMonth => month < 12
      ? DateTime(year, month + 1, 0).day
      : DateTime(year + 1, 1, 0).day;

  String get weekdayName => weekdayNames[weekday - 1];
}
