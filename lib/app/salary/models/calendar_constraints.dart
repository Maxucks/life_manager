import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_constraints.freezed.dart';
part 'calendar_constraints.g.dart';

@freezed
class CalendarConstraints with _$CalendarConstraints {
  const factory CalendarConstraints({
    required int year,
    required int month,
    required bool isPrepayment,
  }) = _CalendarConstraints;

  factory CalendarConstraints.fromJson(Map<String, dynamic> json) =>
      _$CalendarConstraintsFromJson(json);
}
