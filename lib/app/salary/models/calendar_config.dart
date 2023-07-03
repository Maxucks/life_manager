import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_config.freezed.dart';
part 'calendar_config.g.dart';

@freezed
class CalendarConfig with _$CalendarConfig {
  const factory CalendarConfig({
    required DateTime currentDate,
    required int month,
    required int year,
    required List<DateTime> range,
    required bool isPrepayment,
    required int daysLeft,
  }) = _CalendarConfig;

  factory CalendarConfig.fromJson(Map<String, dynamic> json) =>
      _$CalendarConfigFromJson(json);
}
