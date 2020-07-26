// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'holiday_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
HolidayDto _$HolidayDtoFromJson(Map<String, dynamic> json) {
  return _HolidayDto.fromJson(json);
}

class _$HolidayDtoTearOff {
  const _$HolidayDtoTearOff();

  _HolidayDto call(
      {@required int epochTimeStamp, @required int hours, @required int year}) {
    return _HolidayDto(
      epochTimeStamp: epochTimeStamp,
      hours: hours,
      year: year,
    );
  }
}

// ignore: unused_element
const $HolidayDto = _$HolidayDtoTearOff();

mixin _$HolidayDto {
  int get epochTimeStamp;
  int get hours;
  int get year;

  Map<String, dynamic> toJson();
  $HolidayDtoCopyWith<HolidayDto> get copyWith;
}

abstract class $HolidayDtoCopyWith<$Res> {
  factory $HolidayDtoCopyWith(
          HolidayDto value, $Res Function(HolidayDto) then) =
      _$HolidayDtoCopyWithImpl<$Res>;
  $Res call({int epochTimeStamp, int hours, int year});
}

class _$HolidayDtoCopyWithImpl<$Res> implements $HolidayDtoCopyWith<$Res> {
  _$HolidayDtoCopyWithImpl(this._value, this._then);

  final HolidayDto _value;
  // ignore: unused_field
  final $Res Function(HolidayDto) _then;

  @override
  $Res call({
    Object epochTimeStamp = freezed,
    Object hours = freezed,
    Object year = freezed,
  }) {
    return _then(_value.copyWith(
      epochTimeStamp: epochTimeStamp == freezed
          ? _value.epochTimeStamp
          : epochTimeStamp as int,
      hours: hours == freezed ? _value.hours : hours as int,
      year: year == freezed ? _value.year : year as int,
    ));
  }
}

abstract class _$HolidayDtoCopyWith<$Res> implements $HolidayDtoCopyWith<$Res> {
  factory _$HolidayDtoCopyWith(
          _HolidayDto value, $Res Function(_HolidayDto) then) =
      __$HolidayDtoCopyWithImpl<$Res>;
  @override
  $Res call({int epochTimeStamp, int hours, int year});
}

class __$HolidayDtoCopyWithImpl<$Res> extends _$HolidayDtoCopyWithImpl<$Res>
    implements _$HolidayDtoCopyWith<$Res> {
  __$HolidayDtoCopyWithImpl(
      _HolidayDto _value, $Res Function(_HolidayDto) _then)
      : super(_value, (v) => _then(v as _HolidayDto));

  @override
  _HolidayDto get _value => super._value as _HolidayDto;

  @override
  $Res call({
    Object epochTimeStamp = freezed,
    Object hours = freezed,
    Object year = freezed,
  }) {
    return _then(_HolidayDto(
      epochTimeStamp: epochTimeStamp == freezed
          ? _value.epochTimeStamp
          : epochTimeStamp as int,
      hours: hours == freezed ? _value.hours : hours as int,
      year: year == freezed ? _value.year : year as int,
    ));
  }
}

@JsonSerializable()
class _$_HolidayDto with DiagnosticableTreeMixin implements _HolidayDto {
  const _$_HolidayDto(
      {@required this.epochTimeStamp,
      @required this.hours,
      @required this.year})
      : assert(epochTimeStamp != null),
        assert(hours != null),
        assert(year != null);

  factory _$_HolidayDto.fromJson(Map<String, dynamic> json) =>
      _$_$_HolidayDtoFromJson(json);

  @override
  final int epochTimeStamp;
  @override
  final int hours;
  @override
  final int year;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HolidayDto(epochTimeStamp: $epochTimeStamp, hours: $hours, year: $year)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HolidayDto'))
      ..add(DiagnosticsProperty('epochTimeStamp', epochTimeStamp))
      ..add(DiagnosticsProperty('hours', hours))
      ..add(DiagnosticsProperty('year', year));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HolidayDto &&
            (identical(other.epochTimeStamp, epochTimeStamp) ||
                const DeepCollectionEquality()
                    .equals(other.epochTimeStamp, epochTimeStamp)) &&
            (identical(other.hours, hours) ||
                const DeepCollectionEquality().equals(other.hours, hours)) &&
            (identical(other.year, year) ||
                const DeepCollectionEquality().equals(other.year, year)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(epochTimeStamp) ^
      const DeepCollectionEquality().hash(hours) ^
      const DeepCollectionEquality().hash(year);

  @override
  _$HolidayDtoCopyWith<_HolidayDto> get copyWith =>
      __$HolidayDtoCopyWithImpl<_HolidayDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_HolidayDtoToJson(this);
  }
}

abstract class _HolidayDto implements HolidayDto {
  const factory _HolidayDto(
      {@required int epochTimeStamp,
      @required int hours,
      @required int year}) = _$_HolidayDto;

  factory _HolidayDto.fromJson(Map<String, dynamic> json) =
      _$_HolidayDto.fromJson;

  @override
  int get epochTimeStamp;
  @override
  int get hours;
  @override
  int get year;
  @override
  _$HolidayDtoCopyWith<_HolidayDto> get copyWith;
}
