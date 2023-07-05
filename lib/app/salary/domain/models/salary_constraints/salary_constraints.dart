import 'package:freezed_annotation/freezed_annotation.dart';

part 'salary_constraints.freezed.dart';
part 'salary_constraints.g.dart';

@freezed
class SalaryConstraints with _$SalaryConstraints {
  const SalaryConstraints._();

  const factory SalaryConstraints({
    required double rate,
    required Set<int> weekends,
    required Set<DateTime> holidays,
    required int hpdContract,
    required int hpdNorm,
    required int middleDay,
    required (int, int) boundaries,
  }) = _SalaryConstraints;

  static const storageKey = "salary_constraints";

  factory SalaryConstraints.initial() {
    return const SalaryConstraints(
      rate: 137950,
      weekends: {DateTime.saturday, DateTime.sunday},
      holidays: {},
      hpdContract: 7,
      hpdNorm: 8,
      middleDay: 15,
      boundaries: (10, 25),
    );
  }

  factory SalaryConstraints.fromJson(Map<String, dynamic> json) =>
      _$SalaryConstraintsFromJson(json);
}
