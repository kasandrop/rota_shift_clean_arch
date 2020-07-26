/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 11:47
 *
 */

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rotashiftcleanarch/core/error/failures.dart';
import 'package:rotashiftcleanarch/domain/entities/day_off.dart';
import 'package:rotashiftcleanarch/domain/entities/holiday.dart';
import 'package:rotashiftcleanarch/domain/value_objects/input_to_entities.dart';

part 'calendar_state.freezed.dart';

@freezed
abstract class CalendarState with _$CalendarState {
  const factory CalendarState(
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
          Option<Either<Failure, Unit>> failureOrSuccessOption
      //@required Option<Either<Failure, List<DayOff>>> daysOffOption,
      // @required bool isError,
      // @required Option<Either<Failure, Unit>> daysOff,
      }) = _CalendarState;
}
