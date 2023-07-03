import 'package:life_manager/app/core/utils/date_time_utils.dart';

typedef CalendarBoundaries = (int x, int y);
typedef CalendarRange = List<DateTime>;

class CalendarManager {
  static int daysLeftTillSalary({
    required DateTime date,
    required CalendarRange range,
  }) {
    final currentDayIndex = range.indexWhere((d) => d.day == date.day);
    return range.length - currentDayIndex;
  }

  static (int year, int month, bool isFirstHalf) partitonInfo({
    required DateTime date,
    required CalendarBoundaries boundaries,
  }) {
    final int month, year;

    if (date.day <= 10) {
      if (date.month == 1) {
        (year, month) = (date.year - 1, 12);
      } else {
        (year, month) = (date.year, date.month - 1);
      }
    } else {
      (year, month) = (date.year, date.month);
    }

    final isFirst = isFirstHalf(date, boundaries);

    return (year, month, isFirst);
  }

  static bool isFirstHalf(
    DateTime date,
    CalendarBoundaries boundaries,
  ) {
    return date.day > boundaries.$1 && date.day <= boundaries.$2;
  }

  static CalendarRange createFullMonthRange(DateTime date) {
    return List.generate(
      date.lastDayOfMonth,
      (index) => DateTime(date.year, date.month, index + 1),
    );
  }

  /// Creates range of dates based on current [date] and [boundaries]
  ///
  /// For example:
  /// 1. [boundaries] == `(10, 25)`, date.day == `15`, so it will create
  /// range with dates `10..25`
  /// 2. [boundaries] == `(10, 25)`, date.day == `6`, so it will create
  /// range with dates `25..end of current month` + `1..10
  /// next month`
  static CalendarRange createRangeFromBoundaries({
    required DateTime date,
    required CalendarBoundaries boundaries,
    required int middleDay,
  }) {
    if (isFirstHalf(date, boundaries)) {
      return [
        for (int day = 1; day <= boundaries.$2; day++)
          DateTime(date.year, date.month, day),
      ];
    } else {
      return [
        for (int day = middleDay + 1; day <= date.lastDayOfMonth; day++)
          DateTime(date.year, date.month, day),
        for (int day = 1; day <= boundaries.$1; day++)
          date.month < 12
              ? DateTime(date.year, date.month + 1, day)
              : DateTime(date.year + 1, 1, day),
      ];
    }
  }
}
