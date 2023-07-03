import 'package:life_manager/app/salary/models/salary_calculation.dart';
import 'package:life_manager/app/salary/utils/calendar_manager.dart';
import 'package:life_manager/app/salary/utils/salary_manager/tax_calculator.dart';

/// * `hpd` is `hours per day`
///
///
/// `hpdNorm`, `hpdContract`: for example, working norm is 8h per day (`hpdNorm`),
/// but I have only 7h per day in contract (`hpdContract`)
///
/// `weekends`: for example = `{ DateTime.saturday, DateTime.sunday }`
class SalaryManager {
  const SalaryManager({
    required this.taxCalculator,
  });

  final TaxCalculator taxCalculator;

  double _getTotal({
    required double rate,
    required int hpdNorm,
    required int hpdContract,
  }) =>
      taxCalculator.calculate(rate) * (hpdContract / hpdNorm);

  SalaryCalculation calculateByRange({
    required double rate,
    required int year,
    required int month,
    required CalendarRange range,
    required int middleDay,
    CalendarRange? holidays,
    int hpdNorm = 8,
    int hpdContract = 8,
    Set<int> weekends = const {
      DateTime.saturday,
      DateTime.sunday,
    },
  }) {
    CalendarRange workingDays = [];

    for (var date in range) {
      final isHoliday = holidays?.contains(date) ?? false;
      final isWeekend = weekends.contains(date.weekday);

      if (!(isWeekend || isHoliday)) {
        workingDays.add(date);
      }
    }
    final workingDaysCount = workingDays.length;
    final total = _getTotal(
      rate: rate,
      hpdContract: hpdContract,
      hpdNorm: hpdNorm,
    );

    final dayCost = total / workingDaysCount;
    final hourCost = dayCost / hpdContract;

    final prepaymentWorkingDaysCount =
        workingDays.where((date) => date.day <= middleDay).length;

    final prepayment = dayCost * prepaymentWorkingDaysCount;
    final salary = total - prepayment;

    return SalaryCalculation(
      prepayment: prepayment,
      salary: salary,
      total: total,
      dayCost: dayCost,
      hourCost: hourCost,
    );
  }
}
