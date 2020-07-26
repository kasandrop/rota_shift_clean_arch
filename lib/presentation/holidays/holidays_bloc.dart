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
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rotashiftcleanarch/core/error/failures.dart';
import 'package:rotashiftcleanarch/core/util/simple_log_printer.dart';
import 'package:rotashiftcleanarch/domain/entities/holiday.dart';
import 'package:rotashiftcleanarch/domain/usecases/Params/param.dart';
import 'package:rotashiftcleanarch/domain/usecases/holidays/add_delete_holiday.dart';
import 'package:rotashiftcleanarch/domain/usecases/holidays/change_holidays_hours.dart';
import 'package:rotashiftcleanarch/domain/usecases/holidays/get_holidays.dart';
import 'package:rotashiftcleanarch/domain/value_objects/input_to_entities.dart';
import 'package:rotashiftcleanarch/presentation/calendar/calendar_bloc.dart';

import 'bloc.dart';

//TODO: null exception when no data

class HolidaysBloc extends Bloc<HolidaysEvent, HolidaysState> {
  final ChangeHolidaysHours changeHolidaysHours;
  final AddDeleteHoliday addDeleteHoliday;
  final GetHolidays getHolidays;
  final CalendarBloc calendarBloc;
  StreamSubscription calendarStreamSubscription;

  HolidaysBloc({
    @required this.changeHolidaysHours,
    @required this.addDeleteHoliday,
    @required this.getHolidays,
    @required this.calendarBloc,
  }) {
    calendarStreamSubscription = calendarBloc.listen((state) {
      getLogger('HolidaysBloc').d('constructor');
      getLogger('HolidaysBloc')
          .d('HolidaysBloc---listen-from now it will listen');
      if (!state.isSubmitting) {
        getLogger('HolidaysBloc').d('event initialize event added  from bloc');

        add(
          HolidaysEvent.initialize(
            year: state.year,
            rota: state.rota,
            holidaysOption: state.holidaysOption,
            daysOffOption: state.daysOffOption,
          ),
        );
      }
    });
  }
  @override
  HolidaysState get initialState {
    getLogger('HolidaysBloc').d('initialState');
    return HolidaysState.initial();
  }

  @override
  Stream<HolidaysState> mapEventToState(HolidaysEvent event) async* {
    getLogger('HolidaysBloc').d('mapEventToState ');

    yield* event.map(
      addDeleteHoliday: (event) async* {
        getLogger('HolidaysBloc').d('mapEventToState-addDeleteHoliday');
        Holiday holiday = Holiday(
          epochTimeStamp: event.holidayDay,
          chosenYear: state.year,
          hours: 8,
        );
        Either<Failure, Unit> creation = await addDeleteHoliday(holiday);

        yield* _updateHolidaysState(
          year: state.year,
        );
      },
      initialize: (event) async* {
        getLogger('HolidaysBloc').d('mapEventToState-initialize');
        yield state.copyWith(
          isSubmitting: false,
          holidaysOption: event.holidaysOption,
          daysOffOption: event.daysOffOption,
          rota: event.rota,
          year: event.year,
        );
      },
      holidayHours: (event) async* {
        getLogger('HolidaysBloc').d('mapEventToState-holidayHoursEvent');
        yield state.copyWith(
          isSubmitting: true,
        );

        //TODO:!!!!!!!!!!!!!!!!!!! inspire yourself with error handle from here
        //  (failure) => Error(message: _mapFailureToMessage(failure)),
        //      (trivia) => Loaded(trivia: trivia),
        await changeHolidaysHours(
          HolidaysHoursParam(
            hours: event.hours,
            holiday: Holiday(
              epochTimeStamp: event.epochTimeStamp,
              chosenYear: state.year,
              hours: 8,
            ),
          ),
        );

        yield* _updateHolidaysState(year: state.year);
      },
    );
  }

  Stream<HolidaysState> _updateHolidaysState({Year year}) async* {
    getLogger(this.runtimeType.toString()).d('_updateHolidaysState');
    Either<Failure, Map<DateTime, List<Holiday>>> holidays;

    ///TODO check year then  getHolidays(year) otherwise holidays=null thats why option

    if (year.isValid()) {
      holidays = await getHolidays(year);
    }

    yield state.copyWith(
      isSubmitting: false,
      holidaysOption: optionOf(holidays),
    );
  }

  @override
  Future<void> close() {
    calendarStreamSubscription.cancel();
    return super.close();
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    getLogger(this.runtimeType.toString()).wtf('onError');
    getLogger(this.runtimeType.toString()).wtf('Error inside mapEventToState ');
    getLogger(this.runtimeType.toString())
        .wtf('..Error' + stackTrace?.toString());
    super.onError(error, stackTrace);
  }

  @override
  void onTransition(Transition<HolidaysEvent, HolidaysState> transition) {
    print(transition);
    super.onTransition(transition);
  }
}
