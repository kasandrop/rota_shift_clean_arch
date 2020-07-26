// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'day_off_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
DayOffDto _$DayOffDtoFromJson(Map<String, dynamic> json) {
  return _DayOffDto.fromJson(json);
}

class _$DayOffDtoTearOff {
  const _$DayOffDtoTearOff();

  _DayOffDto call(
      {@required String id,
      @required int dayNumber,
      @required int year,
      @required int rota,
      @required int chosenYear}) {
    return _DayOffDto(
      id: id,
      dayNumber: dayNumber,
      year: year,
      rota: rota,
      chosenYear: chosenYear,
    );
  }
}

// ignore: unused_element
const $DayOffDto = _$DayOffDtoTearOff();

mixin _$DayOffDto {
  String get id;
  int get dayNumber;
  int get year;
  int get rota;
  int get chosenYear;

  Map<String, dynamic> toJson();
  $DayOffDtoCopyWith<DayOffDto> get copyWith;
}

abstract class $DayOffDtoCopyWith<$Res> {
  factory $DayOffDtoCopyWith(DayOffDto value, $Res Function(DayOffDto) then) =
      _$DayOffDtoCopyWithImpl<$Res>;
  $Res call({String id, int dayNumber, int year, int rota, int chosenYear});
}

class _$DayOffDtoCopyWithImpl<$Res> implements $DayOffDtoCopyWith<$Res> {
  _$DayOffDtoCopyWithImpl(this._value, this._then);

  final DayOffDto _value;
  // ignore: unused_field
  final $Res Function(DayOffDto) _then;

  @override
  $Res call({
    Object id = freezed,
    Object dayNumber = freezed,
    Object year = freezed,
    Object rota = freezed,
    Object chosenYear = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      dayNumber: dayNumber == freezed ? _value.dayNumber : dayNumber as int,
      year: year == freezed ? _value.year : year as int,
      rota: rota == freezed ? _value.rota : rota as int,
      chosenYear: chosenYear == freezed ? _value.chosenYear : chosenYear as int,
    ));
  }
}

abstract class _$DayOffDtoCopyWith<$Res> implements $DayOffDtoCopyWith<$Res> {
  factory _$DayOffDtoCopyWith(
          _DayOffDto value, $Res Function(_DayOffDto) then) =
      __$DayOffDtoCopyWithImpl<$Res>;
  @override
  $Res call({String id, int dayNumber, int year, int rota, int chosenYear});
}

class __$DayOffDtoCopyWithImpl<$Res> extends _$DayOffDtoCopyWithImpl<$Res>
    implements _$DayOffDtoCopyWith<$Res> {
  __$DayOffDtoCopyWithImpl(_DayOffDto _value, $Res Function(_DayOffDto) _then)
      : super(_value, (v) => _then(v as _DayOffDto));

  @override
  _DayOffDto get _value => super._value as _DayOffDto;

  @override
  $Res call({
    Object id = freezed,
    Object dayNumber = freezed,
    Object year = freezed,
    Object rota = freezed,
    Object chosenYear = freezed,
  }) {
    return _then(_DayOffDto(
      id: id == freezed ? _value.id : id as String,
      dayNumber: dayNumber == freezed ? _value.dayNumber : dayNumber as int,
      year: year == freezed ? _value.year : year as int,
      rota: rota == freezed ? _value.rota : rota as int,
      chosenYear: chosenYear == freezed ? _value.chosenYear : chosenYear as int,
    ));
  }
}

@JsonSerializable()
class _$_DayOffDto with DiagnosticableTreeMixin implements _DayOffDto {
  const _$_DayOffDto(
      {@required this.id,
      @required this.dayNumber,
      @required this.year,
      @required this.rota,
      @required this.chosenYear})
      : assert(id != null),
        assert(dayNumber != null),
        assert(year != null),
        assert(rota != null),
        assert(chosenYear != null);

  factory _$_DayOffDto.fromJson(Map<String, dynamic> json) =>
      _$_$_DayOffDtoFromJson(json);

  @override
  final String id;
  @override
  final int dayNumber;
  @override
  final int year;
  @override
  final int rota;
  @override
  final int chosenYear;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DayOffDto(id: $id, dayNumber: $dayNumber, year: $year, rota: $rota, chosenYear: $chosenYear)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DayOffDto'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('dayNumber', dayNumber))
      ..add(DiagnosticsProperty('year', year))
      ..add(DiagnosticsProperty('rota', rota))
      ..add(DiagnosticsProperty('chosenYear', chosenYear));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DayOffDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.dayNumber, dayNumber) ||
                const DeepCollectionEquality()
                    .equals(other.dayNumber, dayNumber)) &&
            (identical(other.year, year) ||
                const DeepCollectionEquality().equals(other.year, year)) &&
            (identical(other.rota, rota) ||
                const DeepCollectionEquality().equals(other.rota, rota)) &&
            (identical(other.chosenYear, chosenYear) ||
                const DeepCollectionEquality()
                    .equals(other.chosenYear, chosenYear)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(dayNumber) ^
      const DeepCollectionEquality().hash(year) ^
      const DeepCollectionEquality().hash(rota) ^
      const DeepCollectionEquality().hash(chosenYear);

  @override
  _$DayOffDtoCopyWith<_DayOffDto> get copyWith =>
      __$DayOffDtoCopyWithImpl<_DayOffDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DayOffDtoToJson(this);
  }
}

abstract class _DayOffDto implements DayOffDto {
  const factory _DayOffDto(
      {@required String id,
      @required int dayNumber,
      @required int year,
      @required int rota,
      @required int chosenYear}) = _$_DayOffDto;

  factory _DayOffDto.fromJson(Map<String, dynamic> json) =
      _$_DayOffDto.fromJson;

  @override
  String get id;
  @override
  int get dayNumber;
  @override
  int get year;
  @override
  int get rota;
  @override
  int get chosenYear;
  @override
  _$DayOffDtoCopyWith<_DayOffDto> get copyWith;
}
