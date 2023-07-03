import 'package:life_manager/app/core/utils/date_time_utils.dart';
import 'package:life_manager/app/salary/models/salary_calculation/salary_calculation.dart';
import 'package:life_manager/app/salary/models/salary_constraints/salary_constraints.dart';
import 'package:life_manager/app/salary/utils/tax_calculator.dart';

typedef CalendarBoundaries = (int x, int y);
typedef CalendarRange = List<DateTime>;

class SalaryService {
  const SalaryService({
    required this.taxCalculator,
  });

  final TaxCalculator taxCalculator;

  // TODO: implement
  Set<int> updateWeekends(Set<int>? weekends) {
    if (weekends != null) {
      return {...weekends};
    }

    final constraints = getConstraints();
    return constraints.weekends;
  }

  // TODO: implement
  List<DateTime> toggleHoliday(DateTime date) {
    final constraints = getConstraints();

    final weekends = constraints.weekends;
    final holidays = constraints.holidays;

    if (!weekends.contains(date.weekday)) {
      return holidays.contains(date)
          ? holidays.where((h) => h != date).toList()
          : [...holidays, date];
    }

    return constraints.holidays;
  }

  // TODO: Get constraints from shared prefs
  SalaryConstraints getConstraints() {
    return const SalaryConstraints(
      rate: 137950,
      weekends: {DateTime.saturday, DateTime.sunday},
      holidays: [],
      hpdContract: 7,
      hpdNorm: 8,
      middleDay: 15,
      boundaries: (10, 25),
    );
  }

  SalaryCalculation getSalary(DateTime date, SalaryConstraints constraints) {
    final isPrepayment = _isPrepayment(date, constraints.boundaries);
    final (salaryYear, salaryMonth) = _getSalaryDate(date);
    final salaryLastDay = DateTime(salaryYear, salaryMonth, 1).lastDayOfMonth;

    // Calendar section
    final calendarRange = _createRangeFromBoundaries(
      c: constraints,
      isPrepayment: isPrepayment,
      salaryMonth: salaryMonth,
      salaryYear: salaryYear,
      salaryMonthDays: salaryLastDay,
    );
    final daysLeft = _daysLeftTillSalary(date, calendarRange);

    // Salary section
    final monthRange =
        _createFullMonthRange(salaryYear, salaryMonth, salaryLastDay);
    final salaryCalculation = _calculateSalaryByRange(constraints, monthRange);

    return SalaryCalculation(
      prepayment: salaryCalculation.prepayment,
      salary: salaryCalculation.salary,
      total: salaryCalculation.total,
      dayCost: salaryCalculation.dayCost,
      hourCost: salaryCalculation.hourCost,
      daysLeft: daysLeft,
      calendarRange: calendarRange,
      salaryYear: salaryYear,
      salaryMonth: salaryMonth,
      salaryLastDay: salaryLastDay,
      isPrepayment: isPrepayment,
    );
  }

  int _daysLeftTillSalary(DateTime date, CalendarRange range) {
    final currentDayIndex = range.indexWhere((d) => d.day == date.day);
    return range.length - currentDayIndex;
  }

  /// Recognize half
  bool _isPrepayment(DateTime date, CalendarBoundaries boundaries) =>
      date.day > boundaries.$1 && date.day <= boundaries.$2;

  /// Recognize month and year of current salary
  (int year, int month) _getSalaryDate(DateTime date) {
    return date.day > 10
        ? (date.year, date.month)
        : date.month == 1
            ? (date.year - 1, 12)
            : (date.year, date.month - 1);
  }

  CalendarRange _createFullMonthRange(int year, int month, int monthDays) =>
      List.generate(monthDays, (index) => DateTime(year, month, index + 1));

  /// Creates range of dates based on current [date] and [boundaries]
  ///
  /// For example:
  /// 1. [boundaries] == `(10, 25)`, date.day == `15`, so it will create
  /// range with dates `10..25`
  /// 2. [boundaries] == `(10, 25)`, date.day == `6`, so it will create
  /// range with dates `25..end of salary month` + `1..10`
  CalendarRange _createRangeFromBoundaries({
    required int salaryYear,
    required int salaryMonth,
    required bool isPrepayment,
    required int salaryMonthDays,
    required SalaryConstraints c,
  }) {
    if (isPrepayment) {
      return [
        for (int day = 1; day <= c.boundaries.$2; day++)
          DateTime(salaryYear, salaryMonth, day),
      ];
    } else {
      return [
        for (int day = c.middleDay + 1; day <= salaryMonthDays; day++)
          DateTime(salaryYear, salaryMonth, day),
        for (int day = 1; day <= c.boundaries.$1; day++)
          salaryMonth < 12
              ? DateTime(salaryYear, salaryMonth + 1, day)
              : DateTime(salaryYear + 1, 1, day),
      ];
    }
  }

  /// Calculates total salary value without taxes
  /// and relative to hours ratio
  double _calculateTotal(SalaryConstraints c) =>
      taxCalculator.calculate(c.rate) * (c.hpdContract / c.hpdNorm);

  /// Calculates all the values of salary by given [CalendarRange]
  _CalculationResult _calculateSalaryByRange(
    SalaryConstraints c,
    CalendarRange range,
  ) {
    CalendarRange workingDays = [];

    for (var date in range) {
      final isHoliday = c.holidays.contains(date);
      final isWeekend = c.weekends.contains(date.weekday);

      if (!(isWeekend || isHoliday)) {
        workingDays.add(date);
      }
    }

    final workingDaysCount = workingDays.length;
    final total = _calculateTotal(c);

    final dayCost = total / workingDaysCount;
    final hourCost = dayCost / c.hpdContract;

    final prepaymentWorkingDaysCount =
        workingDays.where((date) => date.day <= c.middleDay).length;

    final prepayment = dayCost * prepaymentWorkingDaysCount;
    final salary = total - prepayment;

    return _CalculationResult(
      prepayment: prepayment,
      salary: salary,
      total: total,
      dayCost: dayCost,
      hourCost: hourCost,
    );
  }
}

class _CalculationResult {
  const _CalculationResult({
    required this.prepayment,
    required this.salary,
    required this.total,
    required this.dayCost,
    required this.hourCost,
  });

  final double prepayment;
  final double salary;
  final double total;
  final double dayCost;
  final double hourCost;
}
