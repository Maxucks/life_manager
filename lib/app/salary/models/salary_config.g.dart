// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salary_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SalaryConfig _$$_SalaryConfigFromJson(Map<String, dynamic> json) =>
    _$_SalaryConfig(
      rate: (json['rate'] as num).toDouble(),
      weekends:
          (json['weekends'] as List<dynamic>).map((e) => e as int).toSet(),
      holidays: (json['holidays'] as List<dynamic>)
          .map((e) => DateTime.parse(e as String))
          .toList(),
      hpdContract: json['hpdContract'] as int,
      hpdNorm: json['hpdNorm'] as int,
      middleDay: json['middleDay'] as int,
      boundaries: _$recordConvert(
        json['boundaries'],
        ($jsonValue) => (
          $jsonValue[r'$1'] as int,
          $jsonValue[r'$2'] as int,
        ),
      ),
    );

Map<String, dynamic> _$$_SalaryConfigToJson(_$_SalaryConfig instance) =>
    <String, dynamic>{
      'rate': instance.rate,
      'weekends': instance.weekends.toList(),
      'holidays': instance.holidays.map((e) => e.toIso8601String()).toList(),
      'hpdContract': instance.hpdContract,
      'hpdNorm': instance.hpdNorm,
      'middleDay': instance.middleDay,
      'boundaries': {
        r'$1': instance.boundaries.$1,
        r'$2': instance.boundaries.$2,
      },
    };

$Rec _$recordConvert<$Rec>(
  Object? value,
  $Rec Function(Map) convert,
) =>
    convert(value as Map<String, dynamic>);
