import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:life_manager/app/salary/models/calendar_constraints.dart';

part 'calendar_config.freezed.dart';
part 'calendar_config.g.dart';

@Freezed()
class CalendarConfig with _$CalendarConfig {
  const factory CalendarConfig({
    required DateTime currentDate,
    required List<DateTime> range,
    required int daysLeft,
    required CalendarConstraints constraints,
  }) = _CalendarConfig;

  factory CalendarConfig.fromJson(Map<String, dynamic> json) =>
      _$CalendarConfigFromJson(json);
}
