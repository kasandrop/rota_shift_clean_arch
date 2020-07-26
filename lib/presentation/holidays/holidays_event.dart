/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 11:47
 *
 */

import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:rotashiftcleanarch/core/error/failures.dart';
import 'package:rotashiftcleanarch/domain/entities/day_off.dart';
import 'package:rotashiftcleanarch/domain/entities/holiday.dart';
import 'package:rotashiftcleanarch/domain/value_objects/input_to_entities.dart';

part 'holidays_event.freezed.dart';

@freezed
abstract class HolidaysEvent with _$HolidaysEvent {
  const factory HolidaysEvent.addDeleteHoliday({
    @required int holidayDay,
  }) = _AddDeleteHoliday;

  const factory HolidaysEvent.holidayHours({
    int hours,
    int epochTimeStamp,
  }) = _Hours;

  const factory HolidaysEvent.initialize({
    @required
        Option<Either<Failure, Map<DateTime, List<Holiday>>>> holidaysOption,
    @required
        Option<Either<Failure, Map<DateTime, List<DayOff>>>> daysOffOption,
    @required Rota rota,
    @required Year year,
  }) = _Initialized;
}
