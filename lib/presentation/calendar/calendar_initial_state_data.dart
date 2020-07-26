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
import 'package:rotashiftcleanarch/domain/entities/day_off.dart';
import 'package:rotashiftcleanarch/domain/entities/holiday.dart';
import 'package:rotashiftcleanarch/domain/usecases/daysOff/get_annual_days_off.dart';
import 'package:rotashiftcleanarch/domain/usecases/holidays/get_holidays.dart';
import 'package:rotashiftcleanarch/domain/value_objects/input_to_entities.dart';
import 'package:rotashiftcleanarch/domain/value_objects/rota_year.dart';
import 'package:rotashiftcleanarch/domain/value_objects/rota_year_memorized.dart';

class CalendarInitialStateStartUp {
  final RotaYearMemorized rotaYearMemorized;
  final GetAnnualDaysOff getAnnualDaysOff;
  final GetHolidays getHolidays;

  const CalendarInitialStateStartUp({
    @required this.rotaYearMemorized,
    @required this.getAnnualDaysOff,
    @required this.getHolidays,
  });

  int get rota => rotaYearMemorized.rota;

  int get year => rotaYearMemorized.year;

  //TODO:!!!!!!!!IMPORTANT how many times it is called? how to optimise make class mutable?
  RotaYear get rotaYear {
    // RotaYearMemorized rotaYearMemorized=rotaYearMemorized;
    return RotaYear(
      rota: rotaYearMemorized.rota,
      year: rotaYearMemorized.year,
    );
  }

  Future<Option<Either<Failure, Map<DateTime, List<DayOff>>>>>
      get daysOffOption async {
    return getAnnualDaysOff(rotaYear).then(
        (Either<Failure, Map<DateTime, List<DayOff>>> value) =>
            optionOf(value));
  }

  Future<Option<Either<Failure, Map<DateTime, List<Holiday>>>>>
      get holidaysOffOption async {
    return getHolidays(
      Year(
        rotaYear.year.getOrCrash(),
      ),
    ).then((Either<Failure, Map<DateTime, List<Holiday>>> value) =>
        optionOf(value));
  }

// holidaysOption: none(),
}
