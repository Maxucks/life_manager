import 'package:life_manager/app/core/utils/date_time_utils.dart';
import 'package:life_manager/app/salary/models/calendar_constraints.dart';

typedef CalendarBoundaries = (int x, int y);
typedef CalendarRange = List<DateTime>;

class SalaryCalendarService {
  const SalaryCalendarService();

  int daysLeftTillSalary({
    required DateTime date,
    required CalendarRange range,
  }) {
    final currentDayIndex = range.indexWhere((d) => d.day == date.day);
    return range.length - currentDayIndex;
  }

  /// Recognize half
  bool _isPrepayment(DateTime date, CalendarBoundaries boundaries) =>
      date.day > boundaries.$1 && date.day <= boundaries.$2;

  /// Recognize month and year of current salary
  (int year, int month) _whichYYYYMM(DateTime date) {
    return date.day > 10
        ? (date.year, date.month)
        : date.month == 1
            ? (date.year - 1, 12)
            : (date.year, date.month - 1);
  }

  CalendarConstraints getConstraints({
    required DateTime date,
    required CalendarBoundaries boundaries,
  }) {
    final prepayment = _isPrepayment(date, boundaries);
    final (year, month) = _whichYYYYMM(date);

    return CalendarConstraints(
      year: year,
      month: month,
      isPrepayment: prepayment,
    );
  }

  CalendarRange createFullMonthRange(
    DateTime date,
    CalendarConstraints constraints,
  ) {
    final constrainedDate = DateTime(constraints.year, constraints.month, 1);
    return List.generate(
      constrainedDate.lastDayOfMonth,
      (index) =>
          DateTime(constrainedDate.year, constrainedDate.month, index + 1),
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
  CalendarRange createRangeFromBoundaries({
    required DateTime date,
    required int middleDay,
    required CalendarBoundaries boundaries,
    required CalendarConstraints constraints,
  }) {
    final constrainedDate = DateTime(constraints.year, constraints.month, 1);
    if (constraints.isPrepayment) {
      return [
        for (int day = 1; day <= boundaries.$2; day++)
          DateTime(constrainedDate.year, constrainedDate.month, day),
      ];
    } else {
      return [
        for (int day = middleDay + 1;
            day <= constrainedDate.lastDayOfMonth;
            day++)
          DateTime(constrainedDate.year, constrainedDate.month, day),
        for (int day = 1; day <= boundaries.$1; day++)
          date.month < 12
              ? DateTime(constrainedDate.year, constrainedDate.month + 1, day)
              : DateTime(constrainedDate.year + 1, 1, day),
      ];
    }
  }
}
