// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SalaryState _$$_SalaryStateFromJson(Map<String, dynamic> json) =>
    _$_SalaryState(
      currentDate: DateTime.parse(json['currentDate'] as String),
      constraints: SalaryConstraints.fromJson(
          json['constraints'] as Map<String, dynamic>),
      calculation: SalaryCalculation.fromJson(
          json['calculation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SalaryStateToJson(_$_SalaryState instance) =>
    <String, dynamic>{
      'currentDate': instance.currentDate.toIso8601String(),
      'constraints': instance.constraints.toJson(),
      'calculation': instance.calculation.toJson(),
    };
