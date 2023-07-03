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
  SalaryCalculation get calculation => throw _privateConstructorUsedError;
  SalaryConfig get config => throw _privateConstructorUsedError;
  CalendarConfig get calendar => throw _privateConstructorUsedError;

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
      {SalaryCalculation calculation,
      SalaryConfig config,
      CalendarConfig calendar});

  $SalaryCalculationCopyWith<$Res> get calculation;
  $SalaryConfigCopyWith<$Res> get config;
  $CalendarConfigCopyWith<$Res> get calendar;
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
    Object? calculation = null,
    Object? config = null,
    Object? calendar = null,
  }) {
    return _then(_value.copyWith(
      calculation: null == calculation
          ? _value.calculation
          : calculation // ignore: cast_nullable_to_non_nullable
              as SalaryCalculation,
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as SalaryConfig,
      calendar: null == calendar
          ? _value.calendar
          : calendar // ignore: cast_nullable_to_non_nullable
              as CalendarConfig,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SalaryCalculationCopyWith<$Res> get calculation {
    return $SalaryCalculationCopyWith<$Res>(_value.calculation, (value) {
      return _then(_value.copyWith(calculation: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalaryConfigCopyWith<$Res> get config {
    return $SalaryConfigCopyWith<$Res>(_value.config, (value) {
      return _then(_value.copyWith(config: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CalendarConfigCopyWith<$Res> get calendar {
    return $CalendarConfigCopyWith<$Res>(_value.calendar, (value) {
      return _then(_value.copyWith(calendar: value) as $Val);
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
      {SalaryCalculation calculation,
      SalaryConfig config,
      CalendarConfig calendar});

  @override
  $SalaryCalculationCopyWith<$Res> get calculation;
  @override
  $SalaryConfigCopyWith<$Res> get config;
  @override
  $CalendarConfigCopyWith<$Res> get calendar;
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
    Object? calculation = null,
    Object? config = null,
    Object? calendar = null,
  }) {
    return _then(_$_SalaryState(
      calculation: null == calculation
          ? _value.calculation
          : calculation // ignore: cast_nullable_to_non_nullable
              as SalaryCalculation,
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as SalaryConfig,
      calendar: null == calendar
          ? _value.calendar
          : calendar // ignore: cast_nullable_to_non_nullable
              as CalendarConfig,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SalaryState implements _SalaryState {
  const _$_SalaryState(
      {required this.calculation,
      required this.config,
      required this.calendar});

  factory _$_SalaryState.fromJson(Map<String, dynamic> json) =>
      _$$_SalaryStateFromJson(json);

  @override
  final SalaryCalculation calculation;
  @override
  final SalaryConfig config;
  @override
  final CalendarConfig calendar;

  @override
  String toString() {
    return 'SalaryState(calculation: $calculation, config: $config, calendar: $calendar)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SalaryState &&
            (identical(other.calculation, calculation) ||
                other.calculation == calculation) &&
            (identical(other.config, config) || other.config == config) &&
            (identical(other.calendar, calendar) ||
                other.calendar == calendar));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, calculation, config, calendar);

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
      {required final SalaryCalculation calculation,
      required final SalaryConfig config,
      required final CalendarConfig calendar}) = _$_SalaryState;

  factory _SalaryState.fromJson(Map<String, dynamic> json) =
      _$_SalaryState.fromJson;

  @override
  SalaryCalculation get calculation;
  @override
  SalaryConfig get config;
  @override
  CalendarConfig get calendar;
  @override
  @JsonKey(ignore: true)
  _$$_SalaryStateCopyWith<_$_SalaryState> get copyWith =>
      throw _privateConstructorUsedError;
}
