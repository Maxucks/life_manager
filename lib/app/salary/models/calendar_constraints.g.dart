// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_constraints.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CalendarConstraints _$$_CalendarConstraintsFromJson(
        Map<String, dynamic> json) =>
    _$_CalendarConstraints(
      year: json['year'] as int,
      month: json['month'] as int,
      isPrepayment: json['isPrepayment'] as bool,
    );

Map<String, dynamic> _$$_CalendarConstraintsToJson(
        _$_CalendarConstraints instance) =>
    <String, dynamic>{
      'year': instance.year,
      'month': instance.month,
      'isPrepayment': instance.isPrepayment,
    };
