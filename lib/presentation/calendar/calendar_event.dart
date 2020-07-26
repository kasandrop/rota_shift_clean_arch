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
import 'package:rotashiftcleanarch/domain/entities/holiday.dart';

part 'calendar_event.freezed.dart';

@freezed
abstract class CalendarEvent with _$CalendarEvent {
  const factory CalendarEvent.rotaYearChanged({
    String rota,
    String year,
  }) = _rotaYearChanged;

  const factory CalendarEvent.holidayUpdated({
    @required
        Option<Either<Failure, Map<DateTime, List<Holiday>>>> holidaysOption,
  }) = _holidayUpdated;
}
