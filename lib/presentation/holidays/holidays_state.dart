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

part 'holidays_state.freezed.dart';

@freezed
abstract class HolidaysState with _$HolidaysState {
  const factory HolidaysState({
    //TODO: very important!!!!!! not the place in  backend it should be done
    //TODO: very important!!!!!!  and state as well i need to refactor 2places to refactor

    @required Year year,
    @required Rota rota,
    @required
        Option<Either<Failure, Map<DateTime, List<Holiday>>>> holidaysOption,
    @required
        Option<Either<Failure, Map<DateTime, List<DayOff>>>> daysOffOption,
    @required bool isSubmitting,
  }) = _HolidaysState;

  factory HolidaysState.initial() => HolidaysState(
        isSubmitting: true,
        holidaysOption: none(),
        daysOffOption: none(),
        rota: Rota(0),
        year: Year(0),
      );
}
