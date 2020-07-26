// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'holidays_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$HolidaysStateTearOff {
  const _$HolidaysStateTearOff();

  _HolidaysState call(
      {@required
          Year year,
      @required
          Rota rota,
      @required
          Option<Either<Failure, Map<DateTime, List<Holiday>>>> holidaysOption,
      @required
          Option<Either<Failure, Map<DateTime, List<DayOff>>>> daysOffOption,
      @required
          bool isSubmitting}) {
    return _HolidaysState(
      year: year,
      rota: rota,
      holidaysOption: holidaysOption,
      daysOffOption: daysOffOption,
      isSubmitting: isSubmitting,
    );
  }
}

// ignore: unused_element
const $HolidaysState = _$HolidaysStateTearOff();

mixin _$HolidaysState {
  Year get year;
  Rota get rota;
  Option<Either<Failure, Map<DateTime, List<Holiday>>>> get holidaysOption;
  Option<Either<Failure, Map<DateTime, List<DayOff>>>> get daysOffOption;
  bool get isSubmitting;

  $HolidaysStateCopyWith<HolidaysState> get copyWith;
}

abstract class $HolidaysStateCopyWith<$Res> {
  factory $HolidaysStateCopyWith(
          HolidaysState value, $Res Function(HolidaysState) then) =
      _$HolidaysStateCopyWithImpl<$Res>;
  $Res call(
      {Year year,
      Rota rota,
      Option<Either<Failure, Map<DateTime, List<Holiday>>>> holidaysOption,
      Option<Either<Failure, Map<DateTime, List<DayOff>>>> daysOffOption,
      bool isSubmitting});
}

class _$HolidaysStateCopyWithImpl<$Res>
    implements $HolidaysStateCopyWith<$Res> {
  _$HolidaysStateCopyWithImpl(this._value, this._then);

  final HolidaysState _value;
  // ignore: unused_field
  final $Res Function(HolidaysState) _then;

  @override
  $Res call({
    Object year = freezed,
    Object rota = freezed,
    Object holidaysOption = freezed,
    Object daysOffOption = freezed,
    Object isSubmitting = freezed,
  }) {
    return _then(_value.copyWith(
      year: year == freezed ? _value.year : year as Year,
      rota: rota == freezed ? _value.rota : rota as Rota,
      holidaysOption: holidaysOption == freezed
          ? _value.holidaysOption
          : holidaysOption
              as Option<Either<Failure, Map<DateTime, List<Holiday>>>>,
      daysOffOption: daysOffOption == freezed
          ? _value.daysOffOption
          : daysOffOption
              as Option<Either<Failure, Map<DateTime, List<DayOff>>>>,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
    ));
  }
}

abstract class _$HolidaysStateCopyWith<$Res>
    implements $HolidaysStateCopyWith<$Res> {
  factory _$HolidaysStateCopyWith(
          _HolidaysState value, $Res Function(_HolidaysState) then) =
      __$HolidaysStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Year year,
      Rota rota,
      Option<Either<Failure, Map<DateTime, List<Holiday>>>> holidaysOption,
      Option<Either<Failure, Map<DateTime, List<DayOff>>>> daysOffOption,
      bool isSubmitting});
}

class __$HolidaysStateCopyWithImpl<$Res>
    extends _$HolidaysStateCopyWithImpl<$Res>
    implements _$HolidaysStateCopyWith<$Res> {
  __$HolidaysStateCopyWithImpl(
      _HolidaysState _value, $Res Function(_HolidaysState) _then)
      : super(_value, (v) => _then(v as _HolidaysState));

  @override
  _HolidaysState get _value => super._value as _HolidaysState;

  @override
  $Res call({
    Object year = freezed,
    Object rota = freezed,
    Object holidaysOption = freezed,
    Object daysOffOption = freezed,
    Object isSubmitting = freezed,
  }) {
    return _then(_HolidaysState(
      year: year == freezed ? _value.year : year as Year,
      rota: rota == freezed ? _value.rota : rota as Rota,
      holidaysOption: holidaysOption == freezed
          ? _value.holidaysOption
          : holidaysOption
              as Option<Either<Failure, Map<DateTime, List<Holiday>>>>,
      daysOffOption: daysOffOption == freezed
          ? _value.daysOffOption
          : daysOffOption
              as Option<Either<Failure, Map<DateTime, List<DayOff>>>>,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
    ));
  }
}

class _$_HolidaysState implements _HolidaysState {
  const _$_HolidaysState(
      {@required this.year,
      @required this.rota,
      @required this.holidaysOption,
      @required this.daysOffOption,
      @required this.isSubmitting})
      : assert(year != null),
        assert(rota != null),
        assert(holidaysOption != null),
        assert(daysOffOption != null),
        assert(isSubmitting != null);

  @override
  final Year year;
  @override
  final Rota rota;
  @override
  final Option<Either<Failure, Map<DateTime, List<Holiday>>>> holidaysOption;
  @override
  final Option<Either<Failure, Map<DateTime, List<DayOff>>>> daysOffOption;
  @override
  final bool isSubmitting;

  @override
  String toString() {
    return 'HolidaysState(year: $year, rota: $rota, holidaysOption: $holidaysOption, daysOffOption: $daysOffOption, isSubmitting: $isSubmitting)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HolidaysState &&
            (identical(other.year, year) ||
                const DeepCollectionEquality().equals(other.year, year)) &&
            (identical(other.rota, rota) ||
                const DeepCollectionEquality().equals(other.rota, rota)) &&
            (identical(other.holidaysOption, holidaysOption) ||
                const DeepCollectionEquality()
                    .equals(other.holidaysOption, holidaysOption)) &&
            (identical(other.daysOffOption, daysOffOption) ||
                const DeepCollectionEquality()
                    .equals(other.daysOffOption, daysOffOption)) &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(year) ^
      const DeepCollectionEquality().hash(rota) ^
      const DeepCollectionEquality().hash(holidaysOption) ^
      const DeepCollectionEquality().hash(daysOffOption) ^
      const DeepCollectionEquality().hash(isSubmitting);

  @override
  _$HolidaysStateCopyWith<_HolidaysState> get copyWith =>
      __$HolidaysStateCopyWithImpl<_HolidaysState>(this, _$identity);
}

abstract class _HolidaysState implements HolidaysState {
  const factory _HolidaysState(
      {@required
          Year year,
      @required
          Rota rota,
      @required
          Option<Either<Failure, Map<DateTime, List<Holiday>>>> holidaysOption,
      @required
          Option<Either<Failure, Map<DateTime, List<DayOff>>>> daysOffOption,
      @required
          bool isSubmitting}) = _$_HolidaysState;

  @override
  Year get year;
  @override
  Rota get rota;
  @override
  Option<Either<Failure, Map<DateTime, List<Holiday>>>> get holidaysOption;
  @override
  Option<Either<Failure, Map<DateTime, List<DayOff>>>> get daysOffOption;
  @override
  bool get isSubmitting;
  @override
  _$HolidaysStateCopyWith<_HolidaysState> get copyWith;
}
