/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 11:47
 *
 */

import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:rotashiftcleanarch/core/error/failures.dart';
import 'package:rotashiftcleanarch/core/util/simple_log_printer.dart';
import 'package:rotashiftcleanarch/domain/entities/day_off.dart';
import 'package:rotashiftcleanarch/domain/entities/holiday.dart';

import 'calendar_initial_state_data.dart';

class CalendarInitialStateDataClass {
  //final RotaYear rotaYear;

  static CalendarInitialStateStartUp initialStateStartUp;

  final int rota;
  final int year;
  final Option<Either<Failure, Map<DateTime, List<DayOff>>>> daysOffOption;
  final Option<Either<Failure, Map<DateTime, List<Holiday>>>> holidaysOffOption;

  CalendarInitialStateDataClass._({
    this.rota,
    this.year,
    this.daysOffOption,
    this.holidaysOffOption,
  });

  static Future<CalendarInitialStateDataClass> getObject({
    @required CalendarInitialStateStartUp initialStateStartUp,
  }) async {
    getLogger('CalendarInitialStateDataClass').d('getObject');
    int _rota = initialStateStartUp.rota;
    int _year = initialStateStartUp.year;
    Option<Either<Failure, Map<DateTime, List<DayOff>>>> _daysOffOption =
        await initialStateStartUp.daysOffOption;
    Option<Either<Failure, Map<DateTime, List<Holiday>>>> _holidaysOffOption =
        await initialStateStartUp.holidaysOffOption;

    return CalendarInitialStateDataClass._(
      rota: _rota,
      year: _year,
      daysOffOption: _daysOffOption,
      holidaysOffOption: _holidaysOffOption,
    );
  }
}
