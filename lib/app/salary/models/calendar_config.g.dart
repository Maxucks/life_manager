// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CalendarConfig _$$_CalendarConfigFromJson(Map<String, dynamic> json) =>
    _$_CalendarConfig(
      currentDate: DateTime.parse(json['currentDate'] as String),
      month: json['month'] as int,
      year: json['year'] as int,
      range: (json['range'] as List<dynamic>)
          .map((e) => DateTime.parse(e as String))
          .toList(),
      isPrepayment: json['isPrepayment'] as bool,
      daysLeft: json['daysLeft'] as int,
    );

Map<String, dynamic> _$$_CalendarConfigToJson(_$_CalendarConfig instance) =>
    <String, dynamic>{
      'currentDate': instance.currentDate.toIso8601String(),
      'month': instance.month,
      'year': instance.year,
      'range': instance.range.map((e) => e.toIso8601String()).toList(),
      'isPrepayment': instance.isPrepayment,
      'daysLeft': instance.daysLeft,
    };
