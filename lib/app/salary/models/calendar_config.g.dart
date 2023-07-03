// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CalendarConfig _$$_CalendarConfigFromJson(Map<String, dynamic> json) =>
    _$_CalendarConfig(
      currentDate: DateTime.parse(json['currentDate'] as String),
      range: (json['range'] as List<dynamic>)
          .map((e) => DateTime.parse(e as String))
          .toList(),
      daysLeft: json['daysLeft'] as int,
      constraints: CalendarConstraints.fromJson(
          json['constraints'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CalendarConfigToJson(_$_CalendarConfig instance) =>
    <String, dynamic>{
      'currentDate': instance.currentDate.toIso8601String(),
      'range': instance.range.map((e) => e.toIso8601String()).toList(),
      'daysLeft': instance.daysLeft,
      'constraints': instance.constraints.toJson(),
    };
