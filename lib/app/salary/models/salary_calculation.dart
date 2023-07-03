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
  }) = _SalaryCalculation;

  factory SalaryCalculation.fromJson(Map<String, dynamic> json) =>
      _$SalaryCalculationFromJson(json);
}
