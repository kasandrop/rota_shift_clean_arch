/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 11:47
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rotashiftcleanarch/core/error/failures.dart';
import 'package:rotashiftcleanarch/core/util/simple_log_printer.dart';
import 'package:rotashiftcleanarch/domain/entities/day_off.dart';
import 'package:rotashiftcleanarch/domain/entities/holiday.dart';
import 'package:rotashiftcleanarch/domain/helpers/default_year.dart';
import 'package:rotashiftcleanarch/presentation/calendar/calendar_bloc.dart';
import 'package:rotashiftcleanarch/presentation/calendar/calendar_event.dart';
import 'package:rotashiftcleanarch/presentation/calendar/calendar_state.dart';
import 'package:rotashiftcleanarch/presentation/widgets/calendar_widget.dart';
import 'package:rotashiftcleanarch/presentation/widgets/rota_chip.dart';
import 'package:rotashiftcleanarch/presentation/widgets/year_chip.dart';

//
const String INVALID_DATA_MESSAGE = 'Wrong input Data';

const String INSERT_DAY_OFF_EXISTS_FAILURE = 'Insert Day Off Already Exists';
const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String NO_INTERNET_FAILURE_MESSAGE = 'No Internet connection';
const String NO_DATA_SERVER_FAILURE_MESSAGE = 'No data provided yet';
const String NO_DATA_CACHE_FAILURE_MESSAGE =
    'Rota or Year was not saved last time '
    'or configuration did not run properly';

class CalendarScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar Rota'),
        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.add_box),
//            onPressed: () {
//              Navigator.of(context).pushNamed(
//                '/insertion',
//              );
//            },
//          ),
          BlocListener<CalendarBloc, CalendarState>(
            listener: (context, state) {
              getLogger('ApplicationPage').d('build  listener');
            },
            child: IconButton(
              icon: Icon(Icons.event_note),
              onPressed: () async {
                final newHolidays = await Navigator.of(context).pushNamed(
                  '/holidays',
                  // arguments: holidaysPageArguments,
                );
                BlocProvider.of<CalendarBloc>(context).add(
                  CalendarEvent.holidayUpdated(holidaysOption: newHolidays),
                );
              },
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            BlocConsumer<CalendarBloc, CalendarState>(
              listener: (BuildContext context, CalendarState state) {
//            state.isSubmitting
//                ? EasyLoading.show(status: 'Loading...')
//                : EasyLoading.dismiss(animation: true);
                state.daysOffOption.fold(() => {}, (either) {
                  either.fold(
                      (failure) => Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Text(_mapFailureToMessage(failure)),
                            ),
                          ),
                      (_) => {});
                });
              },
              builder: (context, state) {
                return RotaChip(
                  initialValueRota: state.rota.getOrCrash().toString(),
                );
              },
            ),
            BlocBuilder<CalendarBloc, CalendarState>(
              builder: (context, state) {
                return YearChip(
                  currentYearLookup: state.year.getOrCrash().toString(),
                  firstChipLabel: getLookUpYearFromTodayConfiguration2(),
                );
              },
            ),
            BlocBuilder<CalendarBloc, CalendarState>(
              builder: (context, state) {
                getLogger('CalendarPage').d('build bloc builder calendar ');
                getLogger('CalendarPage').d('build inside condition  calendar'
                    ' current  state  is $state');
                Map<DateTime, List<DayOff>> daysOff = {};
                Map<DateTime, List<Holiday>> holidays = {};
                state.daysOffOption.fold(
                  () => null,
                  (either) {
                    either.fold(
                      (_) => null,
                      (r) => daysOff = r,
                    );
                  },
                );
                state.holidaysOption.fold(
                  () => null,
                  (either) {
                    either.fold(
                      (_) => null,
                      (r) => holidays = r,
                    );
                  },
                );
                return CalendarWidget(
                  title: 'Title of the calendar',
                  daysOff: daysOff,
                  holidays: holidays,
                  year: state.year.getOrCrash(),
                  rota: state.rota.getOrCrash(),
                  onDayLongPressed: null,

                  //   onCalendarDayClick: myCalendarDayClick,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

//  myCalendarDayClick(DateTime dateTime, List events) {
//    logger.d(dateTime.toUtc().toString());
//  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      case NoDataCacheFailure:
        return NO_DATA_CACHE_FAILURE_MESSAGE;
      case NoInternetFailure:
        return NO_INTERNET_FAILURE_MESSAGE;
      case NoDataServerFailure:
        return NO_DATA_SERVER_FAILURE_MESSAGE;
      case InvalidInputFailure:
        return INVALID_DATA_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
