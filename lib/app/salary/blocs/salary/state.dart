import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:life_manager/app/salary/models/salary_calculation/salary_calculation.dart';
import 'package:life_manager/app/salary/models/salary_constraints/salary_constraints.dart';

part 'state.freezed.dart';
part 'state.g.dart';

@freezed
class SalaryState with _$SalaryState {
  const factory SalaryState({
    required DateTime currentDate,
    required SalaryConstraints constraints,
    required SalaryCalculation calculation,
  }) = _SalaryState;

  factory SalaryState.initial() {
    return SalaryState(
      currentDate: DateTime.now(),
      constraints: const SalaryConstraints(
        rate: 137950,
        weekends: {DateTime.saturday, DateTime.sunday},
        holidays: [],
        hpdContract: 7,
        hpdNorm: 8,
        middleDay: 15,
        boundaries: (10, 25),
      ),
      calculation: const SalaryCalculation(
        prepayment: 0,
        salary: 0,
        total: 0,
        dayCost: 0,
        hourCost: 0,
        calendarRange: [],
        daysLeft: 0,
        salaryMonth: 1,
        salaryYear: 1970,
        isPrepayment: true,
        salaryLastDay: 30,
      ),
    );
  }

  factory SalaryState.fromJson(Map<String, dynamic> json) =>
      _$SalaryStateFromJson(json);
}
