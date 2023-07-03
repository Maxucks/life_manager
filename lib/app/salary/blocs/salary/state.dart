import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:life_manager/app/salary/models/calendar_config.dart';
import 'package:life_manager/app/salary/models/salary_calculation.dart';
import 'package:life_manager/app/salary/models/salary_config.dart';

part 'state.freezed.dart';
part 'state.g.dart';

@freezed
class SalaryState with _$SalaryState {
  const factory SalaryState({
    required SalaryCalculation calculation,
    required SalaryConfig config,
    required CalendarConfig calendar,
  }) = _SalaryState;

  factory SalaryState.initial() {
    return SalaryState(
      config: const SalaryConfig(
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
      ),
      calendar: CalendarConfig(
        currentDate: DateTime.now(),
        month: 1,
        year: 0,
        range: const [],
        isPrepayment: true,
        daysLeft: 0,
      ),
    );
  }

  factory SalaryState.fromJson(Map<String, dynamic> json) =>
      _$SalaryStateFromJson(json);
}
