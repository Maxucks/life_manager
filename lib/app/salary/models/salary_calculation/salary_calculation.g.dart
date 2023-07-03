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
      daysLeft: json['daysLeft'] as int,
      calendarRange: (json['calendarRange'] as List<dynamic>)
          .map((e) => DateTime.parse(e as String))
          .toList(),
      salaryYear: json['salaryYear'] as int,
      salaryMonth: json['salaryMonth'] as int,
      salaryLastDay: json['salaryLastDay'] as int,
      isPrepayment: json['isPrepayment'] as bool,
    );

Map<String, dynamic> _$$_SalaryCalculationToJson(
        _$_SalaryCalculation instance) =>
    <String, dynamic>{
      'prepayment': instance.prepayment,
      'salary': instance.salary,
      'total': instance.total,
      'dayCost': instance.dayCost,
      'hourCost': instance.hourCost,
      'daysLeft': instance.daysLeft,
      'calendarRange':
          instance.calendarRange.map((e) => e.toIso8601String()).toList(),
      'salaryYear': instance.salaryYear,
      'salaryMonth': instance.salaryMonth,
      'salaryLastDay': instance.salaryLastDay,
      'isPrepayment': instance.isPrepayment,
    };
