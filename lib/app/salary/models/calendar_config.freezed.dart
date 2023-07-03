// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CalendarConfig _$CalendarConfigFromJson(Map<String, dynamic> json) {
  return _CalendarConfig.fromJson(json);
}

/// @nodoc
mixin _$CalendarConfig {
  DateTime get currentDate => throw _privateConstructorUsedError;
  int get month => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  List<DateTime> get range => throw _privateConstructorUsedError;
  bool get isPrepayment => throw _privateConstructorUsedError;
  int get daysLeft => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CalendarConfigCopyWith<CalendarConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarConfigCopyWith<$Res> {
  factory $CalendarConfigCopyWith(
          CalendarConfig value, $Res Function(CalendarConfig) then) =
      _$CalendarConfigCopyWithImpl<$Res, CalendarConfig>;
  @useResult
  $Res call(
      {DateTime currentDate,
      int month,
      int year,
      List<DateTime> range,
      bool isPrepayment,
      int daysLeft});
}

/// @nodoc
class _$CalendarConfigCopyWithImpl<$Res, $Val extends CalendarConfig>
    implements $CalendarConfigCopyWith<$Res> {
  _$CalendarConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentDate = null,
    Object? month = null,
    Object? year = null,
    Object? range = null,
    Object? isPrepayment = null,
    Object? daysLeft = null,
  }) {
    return _then(_value.copyWith(
      currentDate: null == currentDate
          ? _value.currentDate
          : currentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      range: null == range
          ? _value.range
          : range // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      isPrepayment: null == isPrepayment
          ? _value.isPrepayment
          : isPrepayment // ignore: cast_nullable_to_non_nullable
              as bool,
      daysLeft: null == daysLeft
          ? _value.daysLeft
          : daysLeft // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CalendarConfigCopyWith<$Res>
    implements $CalendarConfigCopyWith<$Res> {
  factory _$$_CalendarConfigCopyWith(
          _$_CalendarConfig value, $Res Function(_$_CalendarConfig) then) =
      __$$_CalendarConfigCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime currentDate,
      int month,
      int year,
      List<DateTime> range,
      bool isPrepayment,
      int daysLeft});
}

/// @nodoc
class __$$_CalendarConfigCopyWithImpl<$Res>
    extends _$CalendarConfigCopyWithImpl<$Res, _$_CalendarConfig>
    implements _$$_CalendarConfigCopyWith<$Res> {
  __$$_CalendarConfigCopyWithImpl(
      _$_CalendarConfig _value, $Res Function(_$_CalendarConfig) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentDate = null,
    Object? month = null,
    Object? year = null,
    Object? range = null,
    Object? isPrepayment = null,
    Object? daysLeft = null,
  }) {
    return _then(_$_CalendarConfig(
      currentDate: null == currentDate
          ? _value.currentDate
          : currentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      range: null == range
          ? _value._range
          : range // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      isPrepayment: null == isPrepayment
          ? _value.isPrepayment
          : isPrepayment // ignore: cast_nullable_to_non_nullable
              as bool,
      daysLeft: null == daysLeft
          ? _value.daysLeft
          : daysLeft // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CalendarConfig implements _CalendarConfig {
  const _$_CalendarConfig(
      {required this.currentDate,
      required this.month,
      required this.year,
      required final List<DateTime> range,
      required this.isPrepayment,
      required this.daysLeft})
      : _range = range;

  factory _$_CalendarConfig.fromJson(Map<String, dynamic> json) =>
      _$$_CalendarConfigFromJson(json);

  @override
  final DateTime currentDate;
  @override
  final int month;
  @override
  final int year;
  final List<DateTime> _range;
  @override
  List<DateTime> get range {
    if (_range is EqualUnmodifiableListView) return _range;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_range);
  }

  @override
  final bool isPrepayment;
  @override
  final int daysLeft;

  @override
  String toString() {
    return 'CalendarConfig(currentDate: $currentDate, month: $month, year: $year, range: $range, isPrepayment: $isPrepayment, daysLeft: $daysLeft)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CalendarConfig &&
            (identical(other.currentDate, currentDate) ||
                other.currentDate == currentDate) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.year, year) || other.year == year) &&
            const DeepCollectionEquality().equals(other._range, _range) &&
            (identical(other.isPrepayment, isPrepayment) ||
                other.isPrepayment == isPrepayment) &&
            (identical(other.daysLeft, daysLeft) ||
                other.daysLeft == daysLeft));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, currentDate, month, year,
      const DeepCollectionEquality().hash(_range), isPrepayment, daysLeft);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CalendarConfigCopyWith<_$_CalendarConfig> get copyWith =>
      __$$_CalendarConfigCopyWithImpl<_$_CalendarConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CalendarConfigToJson(
      this,
    );
  }
}

abstract class _CalendarConfig implements CalendarConfig {
  const factory _CalendarConfig(
      {required final DateTime currentDate,
      required final int month,
      required final int year,
      required final List<DateTime> range,
      required final bool isPrepayment,
      required final int daysLeft}) = _$_CalendarConfig;

  factory _CalendarConfig.fromJson(Map<String, dynamic> json) =
      _$_CalendarConfig.fromJson;

  @override
  DateTime get currentDate;
  @override
  int get month;
  @override
  int get year;
  @override
  List<DateTime> get range;
  @override
  bool get isPrepayment;
  @override
  int get daysLeft;
  @override
  @JsonKey(ignore: true)
  _$$_CalendarConfigCopyWith<_$_CalendarConfig> get copyWith =>
      throw _privateConstructorUsedError;
}
