// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_constraints.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CalendarConstraints _$CalendarConstraintsFromJson(Map<String, dynamic> json) {
  return _CalendarConstraints.fromJson(json);
}

/// @nodoc
mixin _$CalendarConstraints {
  int get year => throw _privateConstructorUsedError;
  int get month => throw _privateConstructorUsedError;
  bool get isPrepayment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CalendarConstraintsCopyWith<CalendarConstraints> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarConstraintsCopyWith<$Res> {
  factory $CalendarConstraintsCopyWith(
          CalendarConstraints value, $Res Function(CalendarConstraints) then) =
      _$CalendarConstraintsCopyWithImpl<$Res, CalendarConstraints>;
  @useResult
  $Res call({int year, int month, bool isPrepayment});
}

/// @nodoc
class _$CalendarConstraintsCopyWithImpl<$Res, $Val extends CalendarConstraints>
    implements $CalendarConstraintsCopyWith<$Res> {
  _$CalendarConstraintsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? month = null,
    Object? isPrepayment = null,
  }) {
    return _then(_value.copyWith(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      isPrepayment: null == isPrepayment
          ? _value.isPrepayment
          : isPrepayment // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CalendarConstraintsCopyWith<$Res>
    implements $CalendarConstraintsCopyWith<$Res> {
  factory _$$_CalendarConstraintsCopyWith(_$_CalendarConstraints value,
          $Res Function(_$_CalendarConstraints) then) =
      __$$_CalendarConstraintsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int year, int month, bool isPrepayment});
}

/// @nodoc
class __$$_CalendarConstraintsCopyWithImpl<$Res>
    extends _$CalendarConstraintsCopyWithImpl<$Res, _$_CalendarConstraints>
    implements _$$_CalendarConstraintsCopyWith<$Res> {
  __$$_CalendarConstraintsCopyWithImpl(_$_CalendarConstraints _value,
      $Res Function(_$_CalendarConstraints) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? month = null,
    Object? isPrepayment = null,
  }) {
    return _then(_$_CalendarConstraints(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      isPrepayment: null == isPrepayment
          ? _value.isPrepayment
          : isPrepayment // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CalendarConstraints implements _CalendarConstraints {
  const _$_CalendarConstraints(
      {required this.year, required this.month, required this.isPrepayment});

  factory _$_CalendarConstraints.fromJson(Map<String, dynamic> json) =>
      _$$_CalendarConstraintsFromJson(json);

  @override
  final int year;
  @override
  final int month;
  @override
  final bool isPrepayment;

  @override
  String toString() {
    return 'CalendarConstraints(year: $year, month: $month, isPrepayment: $isPrepayment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CalendarConstraints &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.isPrepayment, isPrepayment) ||
                other.isPrepayment == isPrepayment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, year, month, isPrepayment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CalendarConstraintsCopyWith<_$_CalendarConstraints> get copyWith =>
      __$$_CalendarConstraintsCopyWithImpl<_$_CalendarConstraints>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CalendarConstraintsToJson(
      this,
    );
  }
}

abstract class _CalendarConstraints implements CalendarConstraints {
  const factory _CalendarConstraints(
      {required final int year,
      required final int month,
      required final bool isPrepayment}) = _$_CalendarConstraints;

  factory _CalendarConstraints.fromJson(Map<String, dynamic> json) =
      _$_CalendarConstraints.fromJson;

  @override
  int get year;
  @override
  int get month;
  @override
  bool get isPrepayment;
  @override
  @JsonKey(ignore: true)
  _$$_CalendarConstraintsCopyWith<_$_CalendarConstraints> get copyWith =>
      throw _privateConstructorUsedError;
}
