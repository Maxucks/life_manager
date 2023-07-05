import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:life_manager/app/salary/domain/models/salary_calculation/salary_calculation.dart';
import 'package:life_manager/app/salary/domain/models/salary_constraints/salary_constraints.dart';

part 'state.freezed.dart';
part 'state.g.dart';

@freezed
class SalaryState with _$SalaryState {
  const factory SalaryState({
    required DateTime currentDate,
    SalaryConstraints? constraints,
    SalaryCalculation? calculation,
  }) = _SalaryState;

  factory SalaryState.initial() {
    return SalaryState(
      currentDate: DateTime.now(),
    );
  }

  factory SalaryState.fromJson(Map<String, dynamic> json) =>
      _$SalaryStateFromJson(json);
}
