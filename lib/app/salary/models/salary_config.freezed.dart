// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'salary_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SalaryConfig _$SalaryConfigFromJson(Map<String, dynamic> json) {
  return _SalaryConfig.fromJson(json);
}

/// @nodoc
mixin _$SalaryConfig {
  double get rate => throw _privateConstructorUsedError;
  Set<int> get weekends => throw _privateConstructorUsedError;
  List<DateTime> get holidays => throw _privateConstructorUsedError;
  int get hpdContract => throw _privateConstructorUsedError;
  int get hpdNorm => throw _privateConstructorUsedError;
  int get middleDay => throw _privateConstructorUsedError;
  (int, int) get boundaries => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalaryConfigCopyWith<SalaryConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalaryConfigCopyWith<$Res> {
  factory $SalaryConfigCopyWith(
          SalaryConfig value, $Res Function(SalaryConfig) then) =
      _$SalaryConfigCopyWithImpl<$Res, SalaryConfig>;
  @useResult
  $Res call(
      {double rate,
      Set<int> weekends,
      List<DateTime> holidays,
      int hpdContract,
      int hpdNorm,
      int middleDay,
      (int, int) boundaries});
}

/// @nodoc
class _$SalaryConfigCopyWithImpl<$Res, $Val extends SalaryConfig>
    implements $SalaryConfigCopyWith<$Res> {
  _$SalaryConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rate = null,
    Object? weekends = null,
    Object? holidays = null,
    Object? hpdContract = null,
    Object? hpdNorm = null,
    Object? middleDay = null,
    Object? boundaries = null,
  }) {
    return _then(_value.copyWith(
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      weekends: null == weekends
          ? _value.weekends
          : weekends // ignore: cast_nullable_to_non_nullable
              as Set<int>,
      holidays: null == holidays
          ? _value.holidays
          : holidays // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      hpdContract: null == hpdContract
          ? _value.hpdContract
          : hpdContract // ignore: cast_nullable_to_non_nullable
              as int,
      hpdNorm: null == hpdNorm
          ? _value.hpdNorm
          : hpdNorm // ignore: cast_nullable_to_non_nullable
              as int,
      middleDay: null == middleDay
          ? _value.middleDay
          : middleDay // ignore: cast_nullable_to_non_nullable
              as int,
      boundaries: null == boundaries
          ? _value.boundaries
          : boundaries // ignore: cast_nullable_to_non_nullable
              as (int, int),
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SalaryConfigCopyWith<$Res>
    implements $SalaryConfigCopyWith<$Res> {
  factory _$$_SalaryConfigCopyWith(
          _$_SalaryConfig value, $Res Function(_$_SalaryConfig) then) =
      __$$_SalaryConfigCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double rate,
      Set<int> weekends,
      List<DateTime> holidays,
      int hpdContract,
      int hpdNorm,
      int middleDay,
      (int, int) boundaries});
}

/// @nodoc
class __$$_SalaryConfigCopyWithImpl<$Res>
    extends _$SalaryConfigCopyWithImpl<$Res, _$_SalaryConfig>
    implements _$$_SalaryConfigCopyWith<$Res> {
  __$$_SalaryConfigCopyWithImpl(
      _$_SalaryConfig _value, $Res Function(_$_SalaryConfig) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rate = null,
    Object? weekends = null,
    Object? holidays = null,
    Object? hpdContract = null,
    Object? hpdNorm = null,
    Object? middleDay = null,
    Object? boundaries = null,
  }) {
    return _then(_$_SalaryConfig(
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      weekends: null == weekends
          ? _value._weekends
          : weekends // ignore: cast_nullable_to_non_nullable
              as Set<int>,
      holidays: null == holidays
          ? _value._holidays
          : holidays // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      hpdContract: null == hpdContract
          ? _value.hpdContract
          : hpdContract // ignore: cast_nullable_to_non_nullable
              as int,
      hpdNorm: null == hpdNorm
          ? _value.hpdNorm
          : hpdNorm // ignore: cast_nullable_to_non_nullable
              as int,
      middleDay: null == middleDay
          ? _value.middleDay
          : middleDay // ignore: cast_nullable_to_non_nullable
              as int,
      boundaries: null == boundaries
          ? _value.boundaries
          : boundaries // ignore: cast_nullable_to_non_nullable
              as (int, int),
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SalaryConfig implements _SalaryConfig {
  const _$_SalaryConfig(
      {required this.rate,
      required final Set<int> weekends,
      required final List<DateTime> holidays,
      required this.hpdContract,
      required this.hpdNorm,
      required this.middleDay,
      required this.boundaries})
      : _weekends = weekends,
        _holidays = holidays;

  factory _$_SalaryConfig.fromJson(Map<String, dynamic> json) =>
      _$$_SalaryConfigFromJson(json);

  @override
  final double rate;
  final Set<int> _weekends;
  @override
  Set<int> get weekends {
    if (_weekends is EqualUnmodifiableSetView) return _weekends;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_weekends);
  }

  final List<DateTime> _holidays;
  @override
  List<DateTime> get holidays {
    if (_holidays is EqualUnmodifiableListView) return _holidays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_holidays);
  }

  @override
  final int hpdContract;
  @override
  final int hpdNorm;
  @override
  final int middleDay;
  @override
  final (int, int) boundaries;

  @override
  String toString() {
    return 'SalaryConfig(rate: $rate, weekends: $weekends, holidays: $holidays, hpdContract: $hpdContract, hpdNorm: $hpdNorm, middleDay: $middleDay, boundaries: $boundaries)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SalaryConfig &&
            (identical(other.rate, rate) || other.rate == rate) &&
            const DeepCollectionEquality().equals(other._weekends, _weekends) &&
            const DeepCollectionEquality().equals(other._holidays, _holidays) &&
            (identical(other.hpdContract, hpdContract) ||
                other.hpdContract == hpdContract) &&
            (identical(other.hpdNorm, hpdNorm) || other.hpdNorm == hpdNorm) &&
            (identical(other.middleDay, middleDay) ||
                other.middleDay == middleDay) &&
            (identical(other.boundaries, boundaries) ||
                other.boundaries == boundaries));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      rate,
      const DeepCollectionEquality().hash(_weekends),
      const DeepCollectionEquality().hash(_holidays),
      hpdContract,
      hpdNorm,
      middleDay,
      boundaries);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SalaryConfigCopyWith<_$_SalaryConfig> get copyWith =>
      __$$_SalaryConfigCopyWithImpl<_$_SalaryConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SalaryConfigToJson(
      this,
    );
  }
}

abstract class _SalaryConfig implements SalaryConfig {
  const factory _SalaryConfig(
      {required final double rate,
      required final Set<int> weekends,
      required final List<DateTime> holidays,
      required final int hpdContract,
      required final int hpdNorm,
      required final int middleDay,
      required final (int, int) boundaries}) = _$_SalaryConfig;

  factory _SalaryConfig.fromJson(Map<String, dynamic> json) =
      _$_SalaryConfig.fromJson;

  @override
  double get rate;
  @override
  Set<int> get weekends;
  @override
  List<DateTime> get holidays;
  @override
  int get hpdContract;
  @override
  int get hpdNorm;
  @override
  int get middleDay;
  @override
  (int, int) get boundaries;
  @override
  @JsonKey(ignore: true)
  _$$_SalaryConfigCopyWith<_$_SalaryConfig> get copyWith =>
      throw _privateConstructorUsedError;
}
