// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'holiday.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$HolidayTearOff {
  const _$HolidayTearOff();

  _Holiday call(
      {@required int epochTimeStamp,
      @required int hours,
      @required Year chosenYear}) {
    return _Holiday(
      epochTimeStamp: epochTimeStamp,
      hours: hours,
      chosenYear: chosenYear,
    );
  }
}

// ignore: unused_element
const $Holiday = _$HolidayTearOff();

mixin _$Holiday {
  int get epochTimeStamp;
  int get hours;
  Year get chosenYear;

  $HolidayCopyWith<Holiday> get copyWith;
}

abstract class $HolidayCopyWith<$Res> {
  factory $HolidayCopyWith(Holiday value, $Res Function(Holiday) then) =
      _$HolidayCopyWithImpl<$Res>;
  $Res call({int epochTimeStamp, int hours, Year chosenYear});
}

class _$HolidayCopyWithImpl<$Res> implements $HolidayCopyWith<$Res> {
  _$HolidayCopyWithImpl(this._value, this._then);

  final Holiday _value;
  // ignore: unused_field
  final $Res Function(Holiday) _then;

  @override
  $Res call({
    Object epochTimeStamp = freezed,
    Object hours = freezed,
    Object chosenYear = freezed,
  }) {
    return _then(_value.copyWith(
      epochTimeStamp: epochTimeStamp == freezed
          ? _value.epochTimeStamp
          : epochTimeStamp as int,
      hours: hours == freezed ? _value.hours : hours as int,
      chosenYear:
          chosenYear == freezed ? _value.chosenYear : chosenYear as Year,
    ));
  }
}

abstract class _$HolidayCopyWith<$Res> implements $HolidayCopyWith<$Res> {
  factory _$HolidayCopyWith(_Holiday value, $Res Function(_Holiday) then) =
      __$HolidayCopyWithImpl<$Res>;
  @override
  $Res call({int epochTimeStamp, int hours, Year chosenYear});
}

class __$HolidayCopyWithImpl<$Res> extends _$HolidayCopyWithImpl<$Res>
    implements _$HolidayCopyWith<$Res> {
  __$HolidayCopyWithImpl(_Holiday _value, $Res Function(_Holiday) _then)
      : super(_value, (v) => _then(v as _Holiday));

  @override
  _Holiday get _value => super._value as _Holiday;

  @override
  $Res call({
    Object epochTimeStamp = freezed,
    Object hours = freezed,
    Object chosenYear = freezed,
  }) {
    return _then(_Holiday(
      epochTimeStamp: epochTimeStamp == freezed
          ? _value.epochTimeStamp
          : epochTimeStamp as int,
      hours: hours == freezed ? _value.hours : hours as int,
      chosenYear:
          chosenYear == freezed ? _value.chosenYear : chosenYear as Year,
    ));
  }
}

class _$_Holiday with DiagnosticableTreeMixin implements _Holiday {
  const _$_Holiday(
      {@required this.epochTimeStamp,
      @required this.hours,
      @required this.chosenYear})
      : assert(epochTimeStamp != null),
        assert(hours != null),
        assert(chosenYear != null);

  @override
  final int epochTimeStamp;
  @override
  final int hours;
  @override
  final Year chosenYear;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Holiday(epochTimeStamp: $epochTimeStamp, hours: $hours, chosenYear: $chosenYear)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Holiday'))
      ..add(DiagnosticsProperty('epochTimeStamp', epochTimeStamp))
      ..add(DiagnosticsProperty('hours', hours))
      ..add(DiagnosticsProperty('chosenYear', chosenYear));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Holiday &&
            (identical(other.epochTimeStamp, epochTimeStamp) ||
                const DeepCollectionEquality()
                    .equals(other.epochTimeStamp, epochTimeStamp)) &&
            (identical(other.hours, hours) ||
                const DeepCollectionEquality().equals(other.hours, hours)) &&
            (identical(other.chosenYear, chosenYear) ||
                const DeepCollectionEquality()
                    .equals(other.chosenYear, chosenYear)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(epochTimeStamp) ^
      const DeepCollectionEquality().hash(hours) ^
      const DeepCollectionEquality().hash(chosenYear);

  @override
  _$HolidayCopyWith<_Holiday> get copyWith =>
      __$HolidayCopyWithImpl<_Holiday>(this, _$identity);
}

abstract class _Holiday implements Holiday {
  const factory _Holiday(
      {@required int epochTimeStamp,
      @required int hours,
      @required Year chosenYear}) = _$_Holiday;

  @override
  int get epochTimeStamp;
  @override
  int get hours;
  @override
  Year get chosenYear;
  @override
  _$HolidayCopyWith<_Holiday> get copyWith;
}
