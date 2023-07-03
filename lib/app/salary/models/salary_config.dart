import 'package:freezed_annotation/freezed_annotation.dart';

part 'salary_config.freezed.dart';
part 'salary_config.g.dart';

@freezed
class SalaryConfig with _$SalaryConfig {
  const factory SalaryConfig({
    required double rate,
    required Set<int> weekends,
    required List<DateTime> holidays,
    required int hpdContract,
    required int hpdNorm,
    required int middleDay,
    required (int, int) boundaries,
  }) = _SalaryConfig;

  factory SalaryConfig.fromJson(Map<String, dynamic> json) =>
      _$SalaryConfigFromJson(json);
}
