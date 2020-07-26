// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'day_off.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$DayOffTearOff {
  const _$DayOffTearOff();

  _DayOff call(
      {@required UniqueId id,
      @required Rota rota,
      @required Year year,
      @required DayNumber dayNumber}) {
    return _DayOff(
      id: id,
      rota: rota,
      year: year,
      dayNumber: dayNumber,
    );
  }
}

// ignore: unused_element
const $DayOff = _$DayOffTearOff();

mixin _$DayOff {
  UniqueId get id;
  Rota get rota;
  Year get year;
  DayNumber get dayNumber;

  $DayOffCopyWith<DayOff> get copyWith;
}

abstract class $DayOffCopyWith<$Res> {
  factory $DayOffCopyWith(DayOff value, $Res Function(DayOff) then) =
      _$DayOffCopyWithImpl<$Res>;
  $Res call({UniqueId id, Rota rota, Year year, DayNumber dayNumber});
}

class _$DayOffCopyWithImpl<$Res> implements $DayOffCopyWith<$Res> {
  _$DayOffCopyWithImpl(this._value, this._then);

  final DayOff _value;
  // ignore: unused_field
  final $Res Function(DayOff) _then;

  @override
  $Res call({
    Object id = freezed,
    Object rota = freezed,
    Object year = freezed,
    Object dayNumber = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as UniqueId,
      rota: rota == freezed ? _value.rota : rota as Rota,
      year: year == freezed ? _value.year : year as Year,
      dayNumber:
          dayNumber == freezed ? _value.dayNumber : dayNumber as DayNumber,
    ));
  }
}

abstract class _$DayOffCopyWith<$Res> implements $DayOffCopyWith<$Res> {
  factory _$DayOffCopyWith(_DayOff value, $Res Function(_DayOff) then) =
      __$DayOffCopyWithImpl<$Res>;
  @override
  $Res call({UniqueId id, Rota rota, Year year, DayNumber dayNumber});
}

class __$DayOffCopyWithImpl<$Res> extends _$DayOffCopyWithImpl<$Res>
    implements _$DayOffCopyWith<$Res> {
  __$DayOffCopyWithImpl(_DayOff _value, $Res Function(_DayOff) _then)
      : super(_value, (v) => _then(v as _DayOff));

  @override
  _DayOff get _value => super._value as _DayOff;

  @override
  $Res call({
    Object id = freezed,
    Object rota = freezed,
    Object year = freezed,
    Object dayNumber = freezed,
  }) {
    return _then(_DayOff(
      id: id == freezed ? _value.id : id as UniqueId,
      rota: rota == freezed ? _value.rota : rota as Rota,
      year: year == freezed ? _value.year : year as Year,
      dayNumber:
          dayNumber == freezed ? _value.dayNumber : dayNumber as DayNumber,
    ));
  }
}

class _$_DayOff implements _DayOff {
  const _$_DayOff(
      {@required this.id,
      @required this.rota,
      @required this.year,
      @required this.dayNumber})
      : assert(id != null),
        assert(rota != null),
        assert(year != null),
        assert(dayNumber != null);

  @override
  final UniqueId id;
  @override
  final Rota rota;
  @override
  final Year year;
  @override
  final DayNumber dayNumber;

  @override
  String toString() {
    return 'DayOff(id: $id, rota: $rota, year: $year, dayNumber: $dayNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DayOff &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.rota, rota) ||
                const DeepCollectionEquality().equals(other.rota, rota)) &&
            (identical(other.year, year) ||
                const DeepCollectionEquality().equals(other.year, year)) &&
            (identical(other.dayNumber, dayNumber) ||
                const DeepCollectionEquality()
                    .equals(other.dayNumber, dayNumber)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(rota) ^
      const DeepCollectionEquality().hash(year) ^
      const DeepCollectionEquality().hash(dayNumber);

  @override
  _$DayOffCopyWith<_DayOff> get copyWith =>
      __$DayOffCopyWithImpl<_DayOff>(this, _$identity);
}

abstract class _DayOff implements DayOff {
  const factory _DayOff(
      {@required UniqueId id,
      @required Rota rota,
      @required Year year,
      @required DayNumber dayNumber}) = _$_DayOff;

  @override
  UniqueId get id;
  @override
  Rota get rota;
  @override
  Year get year;
  @override
  DayNumber get dayNumber;
  @override
  _$DayOffCopyWith<_DayOff> get copyWith;
}
