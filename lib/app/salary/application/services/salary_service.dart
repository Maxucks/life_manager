import 'package:life_manager/app/core/utils/date_time_utils.dart';
import 'package:life_manager/app/salary/application/services/salary_repository.dart';
import 'package:life_manager/app/salary/domain/models/salary_calculation/salary_calculation.dart';
import 'package:life_manager/app/salary/domain/models/salary_constraints/salary_constraints.dart';
import 'package:life_manager/app/salary/utils/tax_calculator.dart';

typedef CalendarBoundaries = (int x, int y);
typedef CalendarRange = List<DateTime>;

class SalaryService {
  const SalaryService({
    required this.repo,
    required this.taxCalculator,
  });

  final SalaryRepository repo;
  final TaxCalculator taxCalculator;

  Future<SalaryConstraints> getConstraints() {
    return repo.loadConstraints();
  }

  Set<int> updateWeekends(Set<int>? weekends, SalaryConstraints constraints) {
    if (weekends != null) {
      final updatedWeekends = {...weekends};

      final updatedConstraints = constraints.copyWith(
        weekends: updatedWeekends,
      );
      repo.saveConstraints(updatedConstraints);

      return updatedWeekends;
    }

    return constraints.weekends;
  }

  Set<DateTime> toggleHoliday(DateTime date, SalaryConstraints constraints) {
    final weekends = constraints.weekends;

    final updatedHolidays = {...constraints.holidays};
    if (!weekends.contains(date.weekday)) {
      if (updatedHolidays.contains(date)) {
        updatedHolidays.remove(date);
      } else {
        updatedHolidays.add(date);
      }

      final updatedConstraints = constraints.copyWith(
        holidays: updatedHolidays,
      );
      repo.saveConstraints(updatedConstraints);

      return updatedHolidays;
    }

    return constraints.holidays;
  }

  SalaryCalculation getSalary(DateTime date, SalaryConstraints constraints) {
    final isPrepayment = _isPrepayment(date, constraints.boundaries);
    final (salaryYear, salaryMonth) = _getSalaryDate(date);
    final salaryLastDay = DateTime(salaryYear, salaryMonth, 1).lastDayOfMonth;

    // Calendar section
    final calendarRange = _createRangeFromBoundaries(
      c: constraints,
      // isPrepayment: isPrepayment,
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
    required int salaryMonthDays,
    required SalaryConstraints c,
    bool? isPrepayment,
  }) {
    // TODO: Refactor
    // if (isPrepayment != null) {
    //   if (isPrepayment) {
    //     return [
    //       for (int day = 1; day <= c.boundaries.$2; day++)
    //         DateTime(salaryYear, salaryMonth, day),
    //     ];
    //   } else {
    //     return [
    //       for (int day = c.middleDay + 1; day <= salaryMonthDays; day++)
    //         DateTime(salaryYear, salaryMonth, day),
    //       for (int day = 1; day <= c.boundaries.$1; day++)
    //         salaryMonth < 12
    //             ? DateTime(salaryYear, salaryMonth + 1, day)
    //             : DateTime(salaryYear + 1, 1, day),
    //     ];
    //   }
    // }
    final (startDay, endDay) = isPrepayment == null
        ? (1, salaryMonthDays)
        : isPrepayment
            ? (1, c.boundaries.$2)
            : (c.middleDay + 1, salaryMonthDays);

    return [
      for (int day = startDay; day <= endDay; day++)
        DateTime(salaryYear, salaryMonth, day),
      if (isPrepayment == null || !isPrepayment)
        for (int day = 1; day <= c.boundaries.$1; day++)
          salaryMonth < 12
              ? DateTime(salaryYear, salaryMonth + 1, day)
              : DateTime(salaryYear + 1, 1, day),
    ];
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
