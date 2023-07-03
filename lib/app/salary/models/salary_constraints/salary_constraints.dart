import 'package:freezed_annotation/freezed_annotation.dart';

part 'salary_constraints.freezed.dart';
part 'salary_constraints.g.dart';

@freezed
class SalaryConstraints with _$SalaryConstraints {
  const factory SalaryConstraints({
    required double rate,
    required Set<int> weekends,
    required List<DateTime> holidays,
    required int hpdContract,
    required int hpdNorm,
    required int middleDay,
    required (int, int) boundaries,
  }) = _SalaryConstraints;

  factory SalaryConstraints.fromJson(Map<String, dynamic> json) =>
      _$SalaryConstraintsFromJson(json);
}
