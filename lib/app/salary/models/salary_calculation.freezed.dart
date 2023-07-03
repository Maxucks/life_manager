// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'salary_calculation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SalaryCalculation _$SalaryCalculationFromJson(Map<String, dynamic> json) {
  return _SalaryCalculation.fromJson(json);
}

/// @nodoc
mixin _$SalaryCalculation {
  double get prepayment => throw _privateConstructorUsedError;
  double get salary => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  double get dayCost => throw _privateConstructorUsedError;
  double get hourCost => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalaryCalculationCopyWith<SalaryCalculation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalaryCalculationCopyWith<$Res> {
  factory $SalaryCalculationCopyWith(
          SalaryCalculation value, $Res Function(SalaryCalculation) then) =
      _$SalaryCalculationCopyWithImpl<$Res, SalaryCalculation>;
  @useResult
  $Res call(
      {double prepayment,
      double salary,
      double total,
      double dayCost,
      double hourCost});
}

/// @nodoc
class _$SalaryCalculationCopyWithImpl<$Res, $Val extends SalaryCalculation>
    implements $SalaryCalculationCopyWith<$Res> {
  _$SalaryCalculationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prepayment = null,
    Object? salary = null,
    Object? total = null,
    Object? dayCost = null,
    Object? hourCost = null,
  }) {
    return _then(_value.copyWith(
      prepayment: null == prepayment
          ? _value.prepayment
          : prepayment // ignore: cast_nullable_to_non_nullable
              as double,
      salary: null == salary
          ? _value.salary
          : salary // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      dayCost: null == dayCost
          ? _value.dayCost
          : dayCost // ignore: cast_nullable_to_non_nullable
              as double,
      hourCost: null == hourCost
          ? _value.hourCost
          : hourCost // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SalaryCalculationCopyWith<$Res>
    implements $SalaryCalculationCopyWith<$Res> {
  factory _$$_SalaryCalculationCopyWith(_$_SalaryCalculation value,
          $Res Function(_$_SalaryCalculation) then) =
      __$$_SalaryCalculationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double prepayment,
      double salary,
      double total,
      double dayCost,
      double hourCost});
}

/// @nodoc
class __$$_SalaryCalculationCopyWithImpl<$Res>
    extends _$SalaryCalculationCopyWithImpl<$Res, _$_SalaryCalculation>
    implements _$$_SalaryCalculationCopyWith<$Res> {
  __$$_SalaryCalculationCopyWithImpl(
      _$_SalaryCalculation _value, $Res Function(_$_SalaryCalculation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prepayment = null,
    Object? salary = null,
    Object? total = null,
    Object? dayCost = null,
    Object? hourCost = null,
  }) {
    return _then(_$_SalaryCalculation(
      prepayment: null == prepayment
          ? _value.prepayment
          : prepayment // ignore: cast_nullable_to_non_nullable
              as double,
      salary: null == salary
          ? _value.salary
          : salary // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      dayCost: null == dayCost
          ? _value.dayCost
          : dayCost // ignore: cast_nullable_to_non_nullable
              as double,
      hourCost: null == hourCost
          ? _value.hourCost
          : hourCost // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SalaryCalculation implements _SalaryCalculation {
  const _$_SalaryCalculation(
      {required this.prepayment,
      required this.salary,
      required this.total,
      required this.dayCost,
      required this.hourCost});

  factory _$_SalaryCalculation.fromJson(Map<String, dynamic> json) =>
      _$$_SalaryCalculationFromJson(json);

  @override
  final double prepayment;
  @override
  final double salary;
  @override
  final double total;
  @override
  final double dayCost;
  @override
  final double hourCost;

  @override
  String toString() {
    return 'SalaryCalculation(prepayment: $prepayment, salary: $salary, total: $total, dayCost: $dayCost, hourCost: $hourCost)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SalaryCalculation &&
            (identical(other.prepayment, prepayment) ||
                other.prepayment == prepayment) &&
            (identical(other.salary, salary) || other.salary == salary) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.dayCost, dayCost) || other.dayCost == dayCost) &&
            (identical(other.hourCost, hourCost) ||
                other.hourCost == hourCost));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, prepayment, salary, total, dayCost, hourCost);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SalaryCalculationCopyWith<_$_SalaryCalculation> get copyWith =>
      __$$_SalaryCalculationCopyWithImpl<_$_SalaryCalculation>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SalaryCalculationToJson(
      this,
    );
  }
}

abstract class _SalaryCalculation implements SalaryCalculation {
  const factory _SalaryCalculation(
      {required final double prepayment,
      required final double salary,
      required final double total,
      required final double dayCost,
      required final double hourCost}) = _$_SalaryCalculation;

  factory _SalaryCalculation.fromJson(Map<String, dynamic> json) =
      _$_SalaryCalculation.fromJson;

  @override
  double get prepayment;
  @override
  double get salary;
  @override
  double get total;
  @override
  double get dayCost;
  @override
  double get hourCost;
  @override
  @JsonKey(ignore: true)
  _$$_SalaryCalculationCopyWith<_$_SalaryCalculation> get copyWith =>
      throw _privateConstructorUsedError;
}
