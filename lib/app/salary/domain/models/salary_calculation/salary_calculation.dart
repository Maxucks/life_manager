import 'package:freezed_annotation/freezed_annotation.dart';

part 'salary_calculation.freezed.dart';
part 'salary_calculation.g.dart';

@freezed
class SalaryCalculation with _$SalaryCalculation {
  const factory SalaryCalculation({
    required double prepayment,
    required double salary,
    required double total,
    required double dayCost,
    required double hourCost,
    required int daysLeft,
    required List<DateTime> calendarRange,
    required int salaryYear,
    required int salaryMonth,
    required int salaryLastDay,
    required bool isPrepayment,
  }) = _SalaryCalculation;

  factory SalaryCalculation.fromJson(Map<String, dynamic> json) =>
      _$SalaryCalculationFromJson(json);
}
