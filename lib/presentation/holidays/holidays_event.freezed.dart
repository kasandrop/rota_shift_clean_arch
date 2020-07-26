// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'holidays_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$HolidaysEventTearOff {
  const _$HolidaysEventTearOff();

  _AddDeleteHoliday addDeleteHoliday({@required int holidayDay}) {
    return _AddDeleteHoliday(
      holidayDay: holidayDay,
    );
  }

  _Hours holidayHours({int hours, int epochTimeStamp}) {
    return _Hours(
      hours: hours,
      epochTimeStamp: epochTimeStamp,
    );
  }

  _Initialized initialize(
      {@required
          Option<Either<Failure, Map<DateTime, List<Holiday>>>> holidaysOption,
      @required
          Option<Either<Failure, Map<DateTime, List<DayOff>>>> daysOffOption,
      @required
          Rota rota,
      @required
          Year year}) {
    return _Initialized(
      holidaysOption: holidaysOption,
      daysOffOption: daysOffOption,
      rota: rota,
      year: year,
    );
  }
}

// ignore: unused_element
const $HolidaysEvent = _$HolidaysEventTearOff();

mixin _$HolidaysEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result addDeleteHoliday(int holidayDay),
    @required Result holidayHours(int hours, int epochTimeStamp),
    @required
        Result initialize(
            Option<Either<Failure, Map<DateTime, List<Holiday>>>>
                holidaysOption,
            Option<Either<Failure, Map<DateTime, List<DayOff>>>> daysOffOption,
            Rota rota,
            Year year),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result addDeleteHoliday(int holidayDay),
    Result holidayHours(int hours, int epochTimeStamp),
    Result initialize(
        Option<Either<Failure, Map<DateTime, List<Holiday>>>> holidaysOption,
        Option<Either<Failure, Map<DateTime, List<DayOff>>>> daysOffOption,
        Rota rota,
        Year year),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result addDeleteHoliday(_AddDeleteHoliday value),
    @required Result holidayHours(_Hours value),
    @required Result initialize(_Initialized value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result addDeleteHoliday(_AddDeleteHoliday value),
    Result holidayHours(_Hours value),
    Result initialize(_Initialized value),
    @required Result orElse(),
  });
}

abstract class $HolidaysEventCopyWith<$Res> {
  factory $HolidaysEventCopyWith(
          HolidaysEvent value, $Res Function(HolidaysEvent) then) =
      _$HolidaysEventCopyWithImpl<$Res>;
}

class _$HolidaysEventCopyWithImpl<$Res>
    implements $HolidaysEventCopyWith<$Res> {
  _$HolidaysEventCopyWithImpl(this._value, this._then);

  final HolidaysEvent _value;
  // ignore: unused_field
  final $Res Function(HolidaysEvent) _then;
}

abstract class _$AddDeleteHolidayCopyWith<$Res> {
  factory _$AddDeleteHolidayCopyWith(
          _AddDeleteHoliday value, $Res Function(_AddDeleteHoliday) then) =
      __$AddDeleteHolidayCopyWithImpl<$Res>;
  $Res call({int holidayDay});
}

class __$AddDeleteHolidayCopyWithImpl<$Res>
    extends _$HolidaysEventCopyWithImpl<$Res>
    implements _$AddDeleteHolidayCopyWith<$Res> {
  __$AddDeleteHolidayCopyWithImpl(
      _AddDeleteHoliday _value, $Res Function(_AddDeleteHoliday) _then)
      : super(_value, (v) => _then(v as _AddDeleteHoliday));

  @override
  _AddDeleteHoliday get _value => super._value as _AddDeleteHoliday;

  @override
  $Res call({
    Object holidayDay = freezed,
  }) {
    return _then(_AddDeleteHoliday(
      holidayDay: holidayDay == freezed ? _value.holidayDay : holidayDay as int,
    ));
  }
}

class _$_AddDeleteHoliday implements _AddDeleteHoliday {
  const _$_AddDeleteHoliday({@required this.holidayDay})
      : assert(holidayDay != null);

  @override
  final int holidayDay;

  @override
  String toString() {
    return 'HolidaysEvent.addDeleteHoliday(holidayDay: $holidayDay)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AddDeleteHoliday &&
            (identical(other.holidayDay, holidayDay) ||
                const DeepCollectionEquality()
                    .equals(other.holidayDay, holidayDay)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(holidayDay);

  @override
  _$AddDeleteHolidayCopyWith<_AddDeleteHoliday> get copyWith =>
      __$AddDeleteHolidayCopyWithImpl<_AddDeleteHoliday>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result addDeleteHoliday(int holidayDay),
    @required Result holidayHours(int hours, int epochTimeStamp),
    @required
        Result initialize(
            Option<Either<Failure, Map<DateTime, List<Holiday>>>>
                holidaysOption,
            Option<Either<Failure, Map<DateTime, List<DayOff>>>> daysOffOption,
            Rota rota,
            Year year),
  }) {
    assert(addDeleteHoliday != null);
    assert(holidayHours != null);
    assert(initialize != null);
    return addDeleteHoliday(holidayDay);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result addDeleteHoliday(int holidayDay),
    Result holidayHours(int hours, int epochTimeStamp),
    Result initialize(
        Option<Either<Failure, Map<DateTime, List<Holiday>>>> holidaysOption,
        Option<Either<Failure, Map<DateTime, List<DayOff>>>> daysOffOption,
        Rota rota,
        Year year),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (addDeleteHoliday != null) {
      return addDeleteHoliday(holidayDay);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result addDeleteHoliday(_AddDeleteHoliday value),
    @required Result holidayHours(_Hours value),
    @required Result initialize(_Initialized value),
  }) {
    assert(addDeleteHoliday != null);
    assert(holidayHours != null);
    assert(initialize != null);
    return addDeleteHoliday(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result addDeleteHoliday(_AddDeleteHoliday value),
    Result holidayHours(_Hours value),
    Result initialize(_Initialized value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (addDeleteHoliday != null) {
      return addDeleteHoliday(this);
    }
    return orElse();
  }
}

abstract class _AddDeleteHoliday implements HolidaysEvent {
  const factory _AddDeleteHoliday({@required int holidayDay}) =
      _$_AddDeleteHoliday;

  int get holidayDay;
  _$AddDeleteHolidayCopyWith<_AddDeleteHoliday> get copyWith;
}

abstract class _$HoursCopyWith<$Res> {
  factory _$HoursCopyWith(_Hours value, $Res Function(_Hours) then) =
      __$HoursCopyWithImpl<$Res>;
  $Res call({int hours, int epochTimeStamp});
}

class __$HoursCopyWithImpl<$Res> extends _$HolidaysEventCopyWithImpl<$Res>
    implements _$HoursCopyWith<$Res> {
  __$HoursCopyWithImpl(_Hours _value, $Res Function(_Hours) _then)
      : super(_value, (v) => _then(v as _Hours));

  @override
  _Hours get _value => super._value as _Hours;

  @override
  $Res call({
    Object hours = freezed,
    Object epochTimeStamp = freezed,
  }) {
    return _then(_Hours(
      hours: hours == freezed ? _value.hours : hours as int,
      epochTimeStamp: epochTimeStamp == freezed
          ? _value.epochTimeStamp
          : epochTimeStamp as int,
    ));
  }
}

class _$_Hours implements _Hours {
  const _$_Hours({this.hours, this.epochTimeStamp});

  @override
  final int hours;
  @override
  final int epochTimeStamp;

  @override
  String toString() {
    return 'HolidaysEvent.holidayHours(hours: $hours, epochTimeStamp: $epochTimeStamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Hours &&
            (identical(other.hours, hours) ||
                const DeepCollectionEquality().equals(other.hours, hours)) &&
            (identical(other.epochTimeStamp, epochTimeStamp) ||
                const DeepCollectionEquality()
                    .equals(other.epochTimeStamp, epochTimeStamp)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(hours) ^
      const DeepCollectionEquality().hash(epochTimeStamp);

  @override
  _$HoursCopyWith<_Hours> get copyWith =>
      __$HoursCopyWithImpl<_Hours>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result addDeleteHoliday(int holidayDay),
    @required Result holidayHours(int hours, int epochTimeStamp),
    @required
        Result initialize(
            Option<Either<Failure, Map<DateTime, List<Holiday>>>>
                holidaysOption,
            Option<Either<Failure, Map<DateTime, List<DayOff>>>> daysOffOption,
            Rota rota,
            Year year),
  }) {
    assert(addDeleteHoliday != null);
    assert(holidayHours != null);
    assert(initialize != null);
    return holidayHours(hours, epochTimeStamp);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result addDeleteHoliday(int holidayDay),
    Result holidayHours(int hours, int epochTimeStamp),
    Result initialize(
        Option<Either<Failure, Map<DateTime, List<Holiday>>>> holidaysOption,
        Option<Either<Failure, Map<DateTime, List<DayOff>>>> daysOffOption,
        Rota rota,
        Year year),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (holidayHours != null) {
      return holidayHours(hours, epochTimeStamp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result addDeleteHoliday(_AddDeleteHoliday value),
    @required Result holidayHours(_Hours value),
    @required Result initialize(_Initialized value),
  }) {
    assert(addDeleteHoliday != null);
    assert(holidayHours != null);
    assert(initialize != null);
    return holidayHours(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result addDeleteHoliday(_AddDeleteHoliday value),
    Result holidayHours(_Hours value),
    Result initialize(_Initialized value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (holidayHours != null) {
      return holidayHours(this);
    }
    return orElse();
  }
}

abstract class _Hours implements HolidaysEvent {
  const factory _Hours({int hours, int epochTimeStamp}) = _$_Hours;

  int get hours;
  int get epochTimeStamp;
  _$HoursCopyWith<_Hours> get copyWith;
}

abstract class _$InitializedCopyWith<$Res> {
  factory _$InitializedCopyWith(
          _Initialized value, $Res Function(_Initialized) then) =
      __$InitializedCopyWithImpl<$Res>;
  $Res call(
      {Option<Either<Failure, Map<DateTime, List<Holiday>>>> holidaysOption,
      Option<Either<Failure, Map<DateTime, List<DayOff>>>> daysOffOption,
      Rota rota,
      Year year});
}

class __$InitializedCopyWithImpl<$Res> extends _$HolidaysEventCopyWithImpl<$Res>
    implements _$InitializedCopyWith<$Res> {
  __$InitializedCopyWithImpl(
      _Initialized _value, $Res Function(_Initialized) _then)
      : super(_value, (v) => _then(v as _Initialized));

  @override
  _Initialized get _value => super._value as _Initialized;

  @override
  $Res call({
    Object holidaysOption = freezed,
    Object daysOffOption = freezed,
    Object rota = freezed,
    Object year = freezed,
  }) {
    return _then(_Initialized(
      holidaysOption: holidaysOption == freezed
          ? _value.holidaysOption
          : holidaysOption
              as Option<Either<Failure, Map<DateTime, List<Holiday>>>>,
      daysOffOption: daysOffOption == freezed
          ? _value.daysOffOption
          : daysOffOption
              as Option<Either<Failure, Map<DateTime, List<DayOff>>>>,
      rota: rota == freezed ? _value.rota : rota as Rota,
      year: year == freezed ? _value.year : year as Year,
    ));
  }
}

class _$_Initialized implements _Initialized {
  const _$_Initialized(
      {@required this.holidaysOption,
      @required this.daysOffOption,
      @required this.rota,
      @required this.year})
      : assert(holidaysOption != null),
        assert(daysOffOption != null),
        assert(rota != null),
        assert(year != null);

  @override
  final Option<Either<Failure, Map<DateTime, List<Holiday>>>> holidaysOption;
  @override
  final Option<Either<Failure, Map<DateTime, List<DayOff>>>> daysOffOption;
  @override
  final Rota rota;
  @override
  final Year year;

  @override
  String toString() {
    return 'HolidaysEvent.initialize(holidaysOption: $holidaysOption, daysOffOption: $daysOffOption, rota: $rota, year: $year)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Initialized &&
            (identical(other.holidaysOption, holidaysOption) ||
                const DeepCollectionEquality()
                    .equals(other.holidaysOption, holidaysOption)) &&
            (identical(other.daysOffOption, daysOffOption) ||
                const DeepCollectionEquality()
                    .equals(other.daysOffOption, daysOffOption)) &&
            (identical(other.rota, rota) ||
                const DeepCollectionEquality().equals(other.rota, rota)) &&
            (identical(other.year, year) ||
                const DeepCollectionEquality().equals(other.year, year)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(holidaysOption) ^
      const DeepCollectionEquality().hash(daysOffOption) ^
      const DeepCollectionEquality().hash(rota) ^
      const DeepCollectionEquality().hash(year);

  @override
  _$InitializedCopyWith<_Initialized> get copyWith =>
      __$InitializedCopyWithImpl<_Initialized>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result addDeleteHoliday(int holidayDay),
    @required Result holidayHours(int hours, int epochTimeStamp),
    @required
        Result initialize(
            Option<Either<Failure, Map<DateTime, List<Holiday>>>>
                holidaysOption,
            Option<Either<Failure, Map<DateTime, List<DayOff>>>> daysOffOption,
            Rota rota,
            Year year),
  }) {
    assert(addDeleteHoliday != null);
    assert(holidayHours != null);
    assert(initialize != null);
    return initialize(holidaysOption, daysOffOption, rota, year);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result addDeleteHoliday(int holidayDay),
    Result holidayHours(int hours, int epochTimeStamp),
    Result initialize(
        Option<Either<Failure, Map<DateTime, List<Holiday>>>> holidaysOption,
        Option<Either<Failure, Map<DateTime, List<DayOff>>>> daysOffOption,
        Rota rota,
        Year year),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initialize != null) {
      return initialize(holidaysOption, daysOffOption, rota, year);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result addDeleteHoliday(_AddDeleteHoliday value),
    @required Result holidayHours(_Hours value),
    @required Result initialize(_Initialized value),
  }) {
    assert(addDeleteHoliday != null);
    assert(holidayHours != null);
    assert(initialize != null);
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result addDeleteHoliday(_AddDeleteHoliday value),
    Result holidayHours(_Hours value),
    Result initialize(_Initialized value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements HolidaysEvent {
  const factory _Initialized(
      {@required
          Option<Either<Failure, Map<DateTime, List<Holiday>>>> holidaysOption,
      @required
          Option<Either<Failure, Map<DateTime, List<DayOff>>>> daysOffOption,
      @required
          Rota rota,
      @required
          Year year}) = _$_Initialized;

  Option<Either<Failure, Map<DateTime, List<Holiday>>>> get holidaysOption;
  Option<Either<Failure, Map<DateTime, List<DayOff>>>> get daysOffOption;
  Rota get rota;
  Year get year;
  _$InitializedCopyWith<_Initialized> get copyWith;
}
