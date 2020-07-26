// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'calendar_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$CalendarEventTearOff {
  const _$CalendarEventTearOff();

  _rotaYearChanged rotaYearChanged({String rota, String year}) {
    return _rotaYearChanged(
      rota: rota,
      year: year,
    );
  }

  _holidayUpdated holidayUpdated(
      {@required
          Option<Either<Failure, Map<DateTime, List<Holiday>>>>
              holidaysOption}) {
    return _holidayUpdated(
      holidaysOption: holidaysOption,
    );
  }
}

// ignore: unused_element
const $CalendarEvent = _$CalendarEventTearOff();

mixin _$CalendarEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result rotaYearChanged(String rota, String year),
    @required
        Result holidayUpdated(
            Option<Either<Failure, Map<DateTime, List<Holiday>>>>
                holidaysOption),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result rotaYearChanged(String rota, String year),
    Result holidayUpdated(
        Option<Either<Failure, Map<DateTime, List<Holiday>>>> holidaysOption),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result rotaYearChanged(_rotaYearChanged value),
    @required Result holidayUpdated(_holidayUpdated value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result rotaYearChanged(_rotaYearChanged value),
    Result holidayUpdated(_holidayUpdated value),
    @required Result orElse(),
  });
}

abstract class $CalendarEventCopyWith<$Res> {
  factory $CalendarEventCopyWith(
          CalendarEvent value, $Res Function(CalendarEvent) then) =
      _$CalendarEventCopyWithImpl<$Res>;
}

class _$CalendarEventCopyWithImpl<$Res>
    implements $CalendarEventCopyWith<$Res> {
  _$CalendarEventCopyWithImpl(this._value, this._then);

  final CalendarEvent _value;
  // ignore: unused_field
  final $Res Function(CalendarEvent) _then;
}

abstract class _$rotaYearChangedCopyWith<$Res> {
  factory _$rotaYearChangedCopyWith(
          _rotaYearChanged value, $Res Function(_rotaYearChanged) then) =
      __$rotaYearChangedCopyWithImpl<$Res>;
  $Res call({String rota, String year});
}

class __$rotaYearChangedCopyWithImpl<$Res>
    extends _$CalendarEventCopyWithImpl<$Res>
    implements _$rotaYearChangedCopyWith<$Res> {
  __$rotaYearChangedCopyWithImpl(
      _rotaYearChanged _value, $Res Function(_rotaYearChanged) _then)
      : super(_value, (v) => _then(v as _rotaYearChanged));

  @override
  _rotaYearChanged get _value => super._value as _rotaYearChanged;

  @override
  $Res call({
    Object rota = freezed,
    Object year = freezed,
  }) {
    return _then(_rotaYearChanged(
      rota: rota == freezed ? _value.rota : rota as String,
      year: year == freezed ? _value.year : year as String,
    ));
  }
}

class _$_rotaYearChanged implements _rotaYearChanged {
  const _$_rotaYearChanged({this.rota, this.year});

  @override
  final String rota;
  @override
  final String year;

  @override
  String toString() {
    return 'CalendarEvent.rotaYearChanged(rota: $rota, year: $year)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _rotaYearChanged &&
            (identical(other.rota, rota) ||
                const DeepCollectionEquality().equals(other.rota, rota)) &&
            (identical(other.year, year) ||
                const DeepCollectionEquality().equals(other.year, year)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(rota) ^
      const DeepCollectionEquality().hash(year);

  @override
  _$rotaYearChangedCopyWith<_rotaYearChanged> get copyWith =>
      __$rotaYearChangedCopyWithImpl<_rotaYearChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result rotaYearChanged(String rota, String year),
    @required
        Result holidayUpdated(
            Option<Either<Failure, Map<DateTime, List<Holiday>>>>
                holidaysOption),
  }) {
    assert(rotaYearChanged != null);
    assert(holidayUpdated != null);
    return rotaYearChanged(rota, year);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result rotaYearChanged(String rota, String year),
    Result holidayUpdated(
        Option<Either<Failure, Map<DateTime, List<Holiday>>>> holidaysOption),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (rotaYearChanged != null) {
      return rotaYearChanged(rota, year);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result rotaYearChanged(_rotaYearChanged value),
    @required Result holidayUpdated(_holidayUpdated value),
  }) {
    assert(rotaYearChanged != null);
    assert(holidayUpdated != null);
    return rotaYearChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result rotaYearChanged(_rotaYearChanged value),
    Result holidayUpdated(_holidayUpdated value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (rotaYearChanged != null) {
      return rotaYearChanged(this);
    }
    return orElse();
  }
}

abstract class _rotaYearChanged implements CalendarEvent {
  const factory _rotaYearChanged({String rota, String year}) =
      _$_rotaYearChanged;

  String get rota;
  String get year;
  _$rotaYearChangedCopyWith<_rotaYearChanged> get copyWith;
}

abstract class _$holidayUpdatedCopyWith<$Res> {
  factory _$holidayUpdatedCopyWith(
          _holidayUpdated value, $Res Function(_holidayUpdated) then) =
      __$holidayUpdatedCopyWithImpl<$Res>;
  $Res call(
      {Option<Either<Failure, Map<DateTime, List<Holiday>>>> holidaysOption});
}

class __$holidayUpdatedCopyWithImpl<$Res>
    extends _$CalendarEventCopyWithImpl<$Res>
    implements _$holidayUpdatedCopyWith<$Res> {
  __$holidayUpdatedCopyWithImpl(
      _holidayUpdated _value, $Res Function(_holidayUpdated) _then)
      : super(_value, (v) => _then(v as _holidayUpdated));

  @override
  _holidayUpdated get _value => super._value as _holidayUpdated;

  @override
  $Res call({
    Object holidaysOption = freezed,
  }) {
    return _then(_holidayUpdated(
      holidaysOption: holidaysOption == freezed
          ? _value.holidaysOption
          : holidaysOption
              as Option<Either<Failure, Map<DateTime, List<Holiday>>>>,
    ));
  }
}

class _$_holidayUpdated implements _holidayUpdated {
  const _$_holidayUpdated({@required this.holidaysOption})
      : assert(holidaysOption != null);

  @override
  final Option<Either<Failure, Map<DateTime, List<Holiday>>>> holidaysOption;

  @override
  String toString() {
    return 'CalendarEvent.holidayUpdated(holidaysOption: $holidaysOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _holidayUpdated &&
            (identical(other.holidaysOption, holidaysOption) ||
                const DeepCollectionEquality()
                    .equals(other.holidaysOption, holidaysOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(holidaysOption);

  @override
  _$holidayUpdatedCopyWith<_holidayUpdated> get copyWith =>
      __$holidayUpdatedCopyWithImpl<_holidayUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result rotaYearChanged(String rota, String year),
    @required
        Result holidayUpdated(
            Option<Either<Failure, Map<DateTime, List<Holiday>>>>
                holidaysOption),
  }) {
    assert(rotaYearChanged != null);
    assert(holidayUpdated != null);
    return holidayUpdated(holidaysOption);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result rotaYearChanged(String rota, String year),
    Result holidayUpdated(
        Option<Either<Failure, Map<DateTime, List<Holiday>>>> holidaysOption),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (holidayUpdated != null) {
      return holidayUpdated(holidaysOption);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result rotaYearChanged(_rotaYearChanged value),
    @required Result holidayUpdated(_holidayUpdated value),
  }) {
    assert(rotaYearChanged != null);
    assert(holidayUpdated != null);
    return holidayUpdated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result rotaYearChanged(_rotaYearChanged value),
    Result holidayUpdated(_holidayUpdated value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (holidayUpdated != null) {
      return holidayUpdated(this);
    }
    return orElse();
  }
}

abstract class _holidayUpdated implements CalendarEvent {
  const factory _holidayUpdated(
      {@required
          Option<Either<Failure, Map<DateTime, List<Holiday>>>>
              holidaysOption}) = _$_holidayUpdated;

  Option<Either<Failure, Map<DateTime, List<Holiday>>>> get holidaysOption;
  _$holidayUpdatedCopyWith<_holidayUpdated> get copyWith;
}
