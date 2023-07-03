// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salary_calculation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SalaryCalculation _$$_SalaryCalculationFromJson(Map<String, dynamic> json) =>
    _$_SalaryCalculation(
      prepayment: (json['prepayment'] as num).toDouble(),
      salary: (json['salary'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      dayCost: (json['dayCost'] as num).toDouble(),
      hourCost: (json['hourCost'] as num).toDouble(),
    );

Map<String, dynamic> _$$_SalaryCalculationToJson(
        _$_SalaryCalculation instance) =>
    <String, dynamic>{
      'prepayment': instance.prepayment,
      'salary': instance.salary,
      'total': instance.total,
      'dayCost': instance.dayCost,
      'hourCost': instance.hourCost,
    };
