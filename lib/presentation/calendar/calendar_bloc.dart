/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 11:47
 *
 */

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:rotashiftcleanarch/core/error/failures.dart';
import 'package:rotashiftcleanarch/core/util/simple_log_printer.dart';
import 'package:rotashiftcleanarch/domain/entities/day_off.dart';
import 'package:rotashiftcleanarch/domain/entities/holiday.dart';
import 'package:rotashiftcleanarch/domain/usecases/daysOff/get_annual_days_off.dart';
import 'package:rotashiftcleanarch/domain/usecases/daysOff/get_current_rota_year.dart';
import 'package:rotashiftcleanarch/domain/usecases/holidays/get_holidays.dart';
import 'package:rotashiftcleanarch/domain/value_objects/input_to_entities.dart';
import 'package:rotashiftcleanarch/domain/value_objects/rota_year.dart';

import 'CalendarInitialStateDataClass.dart';
import 'bloc.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  final logger = getLogger('CalendarBloc');
  final GetAnnualDaysOff getAnnualDaysOff;
  final GetCurrentRotaYear getCurrentRotaYear;
  final GetHolidays getHolidays;
  final CalendarInitialStateDataClass initialStateDataClass;

  CalendarBloc({
    @required this.getAnnualDaysOff,
    @required this.getCurrentRotaYear,
    @required this.getHolidays,
    @required this.initialStateDataClass,
  });

  @override
  CalendarState get initialState {
    logger.d('initialState');
    return CalendarState(
      daysOffOption: initialStateDataClass.daysOffOption,
      rota: Rota(initialStateDataClass.rota),
      year: Year(initialStateDataClass.year),
      holidaysOption: initialStateDataClass.holidaysOffOption,
      isSubmitting: false,
      failureOrSuccessOption: none(),
    );
  }

  @override
  void onTransition(Transition<CalendarEvent, CalendarState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    logger.wtf('Error inside mapEventToState ');
    logger.w(error.toString());
    logger.wtf('..Error' + stacktrace?.toString());
    super.onError(error, stacktrace);
  }

  @override
  void onEvent(CalendarEvent event) {
    logger.i(event);
    super.onEvent(event);
  }

  @override
  Stream<CalendarState> mapEventToState(CalendarEvent event) async* {
    yield* event.map(
      rotaYearChanged: (e) async* {
        logger.i('rotaChanged');
        Rota rota1 = Rota.fromString(e.rota);
        Year year1 = Year.fromString(e.year);
        yield state.copyWith(
          rota: rota1.isValid() ? rota1 : state.rota,
          year: year1.isValid() ? year1 : state.year,
          isSubmitting: true,
          daysOffOption: none(),
        );
        yield* _eitherLoadedOrErorState();
      },
      holidayUpdated: (e) async* {
        yield state.copyWith(
          holidaysOption: e.holidaysOption,
          isSubmitting: false,
        );
      },
    );
  }

  Stream<CalendarState> _eitherLoadedOrErorState() async* {
    logger.d('_eitherLoadedOrErorState()');
    Either<Failure, Map<DateTime, List<DayOff>>> daysOff;
    Either<Failure, Map<DateTime, List<Holiday>>> holidays;
    final bool rota = state.rota.isValid();
    final bool year = state.year.isValid();
    if (rota && year) {
      logger.d(state);

      daysOff = await getAnnualDaysOff(
        RotaYear(
          rota: state.rota.getOrCrash(),
          year: state.year.getOrCrash(),
        ),
      );
      holidays = await getHolidays(state.year);
    }
    yield state.copyWith(
      isSubmitting: false,
      daysOffOption: optionOf(daysOff),
      holidaysOption: optionOf(holidays),
    );
    logger.d(state);
  }
}
