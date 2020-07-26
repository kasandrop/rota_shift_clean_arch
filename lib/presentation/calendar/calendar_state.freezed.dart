// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'calendar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$CalendarStateTearOff {
  const _$CalendarStateTearOff();

  _CalendarState call(
      {@required
          Rota rota,
      @required
          Year year,
      @required
          bool isSubmitting,
      @required
          Option<Either<Failure, Map<DateTime, List<DayOff>>>> daysOffOption,
      @required
          Option<Either<Failure, Map<DateTime, List<Holiday>>>> holidaysOption,
      @required
          Option<Either<Failure, Unit>> failureOrSuccessOption}) {
    return _CalendarState(
      rota: rota,
      year: year,
      isSubmitting: isSubmitting,
      daysOffOption: daysOffOption,
      holidaysOption: holidaysOption,
      failureOrSuccessOption: failureOrSuccessOption,
    );
  }
}

// ignore: unused_element
const $CalendarState = _$CalendarStateTearOff();

mixin _$CalendarState {
  Rota get rota;
  Year get year;
  bool get isSubmitting;
  Option<Either<Failure, Map<DateTime, List<DayOff>>>> get daysOffOption;
  Option<Either<Failure, Map<DateTime, List<Holiday>>>> get holidaysOption;
  Option<Either<Failure, Unit>> get failureOrSuccessOption;

  $CalendarStateCopyWith<CalendarState> get copyWith;
}

abstract class $CalendarStateCopyWith<$Res> {
  factory $CalendarStateCopyWith(
          CalendarState value, $Res Function(CalendarState) then) =
      _$CalendarStateCopyWithImpl<$Res>;
  $Res call(
      {Rota rota,
      Year year,
      bool isSubmitting,
      Option<Either<Failure, Map<DateTime, List<DayOff>>>> daysOffOption,
      Option<Either<Failure, Map<DateTime, List<Holiday>>>> holidaysOption,
      Option<Either<Failure, Unit>> failureOrSuccessOption});
}

class _$CalendarStateCopyWithImpl<$Res>
    implements $CalendarStateCopyWith<$Res> {
  _$CalendarStateCopyWithImpl(this._value, this._then);

  final CalendarState _value;
  // ignore: unused_field
  final $Res Function(CalendarState) _then;

  @override
  $Res call({
    Object rota = freezed,
    Object year = freezed,
    Object isSubmitting = freezed,
    Object daysOffOption = freezed,
    Object holidaysOption = freezed,
    Object failureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      rota: rota == freezed ? _value.rota : rota as Rota,
      year: year == freezed ? _value.year : year as Year,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      daysOffOption: daysOffOption == freezed
          ? _value.daysOffOption
          : daysOffOption
              as Option<Either<Failure, Map<DateTime, List<DayOff>>>>,
      holidaysOption: holidaysOption == freezed
          ? _value.holidaysOption
          : holidaysOption
              as Option<Either<Failure, Map<DateTime, List<Holiday>>>>,
      failureOrSuccessOption: failureOrSuccessOption == freezed
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption as Option<Either<Failure, Unit>>,
    ));
  }
}

abstract class _$CalendarStateCopyWith<$Res>
    implements $CalendarStateCopyWith<$Res> {
  factory _$CalendarStateCopyWith(
          _CalendarState value, $Res Function(_CalendarState) then) =
      __$CalendarStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Rota rota,
      Year year,
      bool isSubmitting,
      Option<Either<Failure, Map<DateTime, List<DayOff>>>> daysOffOption,
      Option<Either<Failure, Map<DateTime, List<Holiday>>>> holidaysOption,
      Option<Either<Failure, Unit>> failureOrSuccessOption});
}

class __$CalendarStateCopyWithImpl<$Res>
    extends _$CalendarStateCopyWithImpl<$Res>
    implements _$CalendarStateCopyWith<$Res> {
  __$CalendarStateCopyWithImpl(
      _CalendarState _value, $Res Function(_CalendarState) _then)
      : super(_value, (v) => _then(v as _CalendarState));

  @override
  _CalendarState get _value => super._value as _CalendarState;

  @override
  $Res call({
    Object rota = freezed,
    Object year = freezed,
    Object isSubmitting = freezed,
    Object daysOffOption = freezed,
    Object holidaysOption = freezed,
    Object failureOrSuccessOption = freezed,
  }) {
    return _then(_CalendarState(
      rota: rota == freezed ? _value.rota : rota as Rota,
      year: year == freezed ? _value.year : year as Year,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      daysOffOption: daysOffOption == freezed
          ? _value.daysOffOption
          : daysOffOption
              as Option<Either<Failure, Map<DateTime, List<DayOff>>>>,
      holidaysOption: holidaysOption == freezed
          ? _value.holidaysOption
          : holidaysOption
              as Option<Either<Failure, Map<DateTime, List<Holiday>>>>,
      failureOrSuccessOption: failureOrSuccessOption == freezed
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption as Option<Either<Failure, Unit>>,
    ));
  }
}

class _$_CalendarState with DiagnosticableTreeMixin implements _CalendarState {
  const _$_CalendarState(
      {@required this.rota,
      @required this.year,
      @required this.isSubmitting,
      @required this.daysOffOption,
      @required this.holidaysOption,
      @required this.failureOrSuccessOption})
      : assert(rota != null),
        assert(year != null),
        assert(isSubmitting != null),
        assert(daysOffOption != null),
        assert(holidaysOption != null),
        assert(failureOrSuccessOption != null);

  @override
  final Rota rota;
  @override
  final Year year;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<Failure, Map<DateTime, List<DayOff>>>> daysOffOption;
  @override
  final Option<Either<Failure, Map<DateTime, List<Holiday>>>> holidaysOption;
  @override
  final Option<Either<Failure, Unit>> failureOrSuccessOption;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CalendarState(rota: $rota, year: $year, isSubmitting: $isSubmitting, daysOffOption: $daysOffOption, holidaysOption: $holidaysOption, failureOrSuccessOption: $failureOrSuccessOption)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CalendarState'))
      ..add(DiagnosticsProperty('rota', rota))
      ..add(DiagnosticsProperty('year', year))
      ..add(DiagnosticsProperty('isSubmitting', isSubmitting))
      ..add(DiagnosticsProperty('daysOffOption', daysOffOption))
      ..add(DiagnosticsProperty('holidaysOption', holidaysOption))
      ..add(DiagnosticsProperty(
          'failureOrSuccessOption', failureOrSuccessOption));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CalendarState &&
            (identical(other.rota, rota) ||
                const DeepCollectionEquality().equals(other.rota, rota)) &&
            (identical(other.year, year) ||
                const DeepCollectionEquality().equals(other.year, year)) &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.daysOffOption, daysOffOption) ||
                const DeepCollectionEquality()
                    .equals(other.daysOffOption, daysOffOption)) &&
            (identical(other.holidaysOption, holidaysOption) ||
                const DeepCollectionEquality()
                    .equals(other.holidaysOption, holidaysOption)) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                const DeepCollectionEquality().equals(
                    other.failureOrSuccessOption, failureOrSuccessOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(rota) ^
      const DeepCollectionEquality().hash(year) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(daysOffOption) ^
      const DeepCollectionEquality().hash(holidaysOption) ^
      const DeepCollectionEquality().hash(failureOrSuccessOption);

  @override
  _$CalendarStateCopyWith<_CalendarState> get copyWith =>
      __$CalendarStateCopyWithImpl<_CalendarState>(this, _$identity);
}

abstract class _CalendarState implements CalendarState {
  const factory _CalendarState(
      {@required
          Rota rota,
      @required
          Year year,
      @required
          bool isSubmitting,
      @required
          Option<Either<Failure, Map<DateTime, List<DayOff>>>> daysOffOption,
      @required
          Option<Either<Failure, Map<DateTime, List<Holiday>>>> holidaysOption,
      @required
          Option<Either<Failure, Unit>>
              failureOrSuccessOption}) = _$_CalendarState;

  @override
  Rota get rota;
  @override
  Year get year;
  @override
  bool get isSubmitting;
  @override
  Option<Either<Failure, Map<DateTime, List<DayOff>>>> get daysOffOption;
  @override
  Option<Either<Failure, Map<DateTime, List<Holiday>>>> get holidaysOption;
  @override
  Option<Either<Failure, Unit>> get failureOrSuccessOption;
  @override
  _$CalendarStateCopyWith<_CalendarState> get copyWith;
}
