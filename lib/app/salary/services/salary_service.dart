import 'package:life_manager/app/salary/models/salary_calculation.dart';
import 'package:life_manager/app/salary/services/salary_calendar_service.dart';
import 'package:life_manager/app/salary/utils/tax_calculator.dart';

class SalaryService {
  const SalaryService({
    required this.taxCalculator,
  });

  final TaxCalculator taxCalculator;

  /// Calculates total salary value without taxes
  /// and relative to hours ratio
  double calculateTotal({
    required double rate,
    required int hpdNorm,
    required int hpdContract,
  }) =>
      taxCalculator.calculate(rate) * (hpdContract / hpdNorm);

  /// Calculates all the values of salary by given [CalendarRange]
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
    final total = calculateTotal(
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