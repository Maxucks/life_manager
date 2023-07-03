// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SalaryState _$SalaryStateFromJson(Map<String, dynamic> json) {
  return _SalaryState.fromJson(json);
}

/// @nodoc
mixin _$SalaryState {
  DateTime get currentDate => throw _privateConstructorUsedError;
  SalaryConstraints get constraints => throw _privateConstructorUsedError;
  SalaryCalculation get calculation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalaryStateCopyWith<SalaryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalaryStateCopyWith<$Res> {
  factory $SalaryStateCopyWith(
          SalaryState value, $Res Function(SalaryState) then) =
      _$SalaryStateCopyWithImpl<$Res, SalaryState>;
  @useResult
  $Res call(
      {DateTime currentDate,
      SalaryConstraints constraints,
      SalaryCalculation calculation});

  $SalaryConstraintsCopyWith<$Res> get constraints;
  $SalaryCalculationCopyWith<$Res> get calculation;
}

/// @nodoc
class _$SalaryStateCopyWithImpl<$Res, $Val extends SalaryState>
    implements $SalaryStateCopyWith<$Res> {
  _$SalaryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentDate = null,
    Object? constraints = null,
    Object? calculation = null,
  }) {
    return _then(_value.copyWith(
      currentDate: null == currentDate
          ? _value.currentDate
          : currentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      constraints: null == constraints
          ? _value.constraints
          : constraints // ignore: cast_nullable_to_non_nullable
              as SalaryConstraints,
      calculation: null == calculation
          ? _value.calculation
          : calculation // ignore: cast_nullable_to_non_nullable
              as SalaryCalculation,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SalaryConstraintsCopyWith<$Res> get constraints {
    return $SalaryConstraintsCopyWith<$Res>(_value.constraints, (value) {
      return _then(_value.copyWith(constraints: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalaryCalculationCopyWith<$Res> get calculation {
    return $SalaryCalculationCopyWith<$Res>(_value.calculation, (value) {
      return _then(_value.copyWith(calculation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SalaryStateCopyWith<$Res>
    implements $SalaryStateCopyWith<$Res> {
  factory _$$_SalaryStateCopyWith(
          _$_SalaryState value, $Res Function(_$_SalaryState) then) =
      __$$_SalaryStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime currentDate,
      SalaryConstraints constraints,
      SalaryCalculation calculation});

  @override
  $SalaryConstraintsCopyWith<$Res> get constraints;
  @override
  $SalaryCalculationCopyWith<$Res> get calculation;
}

/// @nodoc
class __$$_SalaryStateCopyWithImpl<$Res>
    extends _$SalaryStateCopyWithImpl<$Res, _$_SalaryState>
    implements _$$_SalaryStateCopyWith<$Res> {
  __$$_SalaryStateCopyWithImpl(
      _$_SalaryState _value, $Res Function(_$_SalaryState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentDate = null,
    Object? constraints = null,
    Object? calculation = null,
  }) {
    return _then(_$_SalaryState(
      currentDate: null == currentDate
          ? _value.currentDate
          : currentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      constraints: null == constraints
          ? _value.constraints
          : constraints // ignore: cast_nullable_to_non_nullable
              as SalaryConstraints,
      calculation: null == calculation
          ? _value.calculation
          : calculation // ignore: cast_nullable_to_non_nullable
              as SalaryCalculation,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SalaryState implements _SalaryState {
  const _$_SalaryState(
      {required this.currentDate,
      required this.constraints,
      required this.calculation});

  factory _$_SalaryState.fromJson(Map<String, dynamic> json) =>
      _$$_SalaryStateFromJson(json);

  @override
  final DateTime currentDate;
  @override
  final SalaryConstraints constraints;
  @override
  final SalaryCalculation calculation;

  @override
  String toString() {
    return 'SalaryState(currentDate: $currentDate, constraints: $constraints, calculation: $calculation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SalaryState &&
            (identical(other.currentDate, currentDate) ||
                other.currentDate == currentDate) &&
            (identical(other.constraints, constraints) ||
                other.constraints == constraints) &&
            (identical(other.calculation, calculation) ||
                other.calculation == calculation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, currentDate, constraints, calculation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SalaryStateCopyWith<_$_SalaryState> get copyWith =>
      __$$_SalaryStateCopyWithImpl<_$_SalaryState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SalaryStateToJson(
      this,
    );
  }
}

abstract class _SalaryState implements SalaryState {
  const factory _SalaryState(
      {required final DateTime currentDate,
      required final SalaryConstraints constraints,
      required final SalaryCalculation calculation}) = _$_SalaryState;

  factory _SalaryState.fromJson(Map<String, dynamic> json) =
      _$_SalaryState.fromJson;

  @override
  DateTime get currentDate;
  @override
  SalaryConstraints get constraints;
  @override
  SalaryCalculation get calculation;
  @override
  @JsonKey(ignore: true)
  _$$_SalaryStateCopyWith<_$_SalaryState> get copyWith =>
      throw _privateConstructorUsedError;
}
