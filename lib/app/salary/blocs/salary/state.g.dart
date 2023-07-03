// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SalaryState _$$_SalaryStateFromJson(Map<String, dynamic> json) =>
    _$_SalaryState(
      calculation: SalaryCalculation.fromJson(
          json['calculation'] as Map<String, dynamic>),
      config: SalaryConfig.fromJson(json['config'] as Map<String, dynamic>),
      calendar:
          CalendarConfig.fromJson(json['calendar'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SalaryStateToJson(_$_SalaryState instance) =>
    <String, dynamic>{
      'calculation': instance.calculation.toJson(),
      'config': instance.config.toJson(),
      'calendar': instance.calendar.toJson(),
    };
