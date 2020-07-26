/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 11:47
 *
 */

import 'package:dartz/dartz.dart';
import 'package:rotashiftcleanarch/core/error/failures.dart';
import 'package:rotashiftcleanarch/core/util/simple_log_printer.dart';
import 'package:rotashiftcleanarch/domain/entities/holiday.dart';
import 'package:rotashiftcleanarch/domain/repositories/holidays_repository.dart';
import 'package:rotashiftcleanarch/domain/value_objects/input_to_entities.dart';
import 'package:rotashiftcleanarch/infrastructure/datasources/abstractions/holidays_local_data_source.dart';
import 'package:rotashiftcleanarch/infrastructure/dtos/holiday_dto.dart';

class HolidaysRepositoryImpl implements HolidaysRepository {
  final HolidaysLocalDataSource holidaysLocalDataSource;

  const HolidaysRepositoryImpl({this.holidaysLocalDataSource});

  @override
  Future<Either<Failure, Unit>> createHoliday({Holiday holiday}) async {
    getLogger(this.runtimeType.toString()).d('createHoliday');
    try {
      await holidaysLocalDataSource.createHoliday(
          holidayDto: HolidayDto.fromDomain(holiday));
      return right(unit);
    } on Exception {
      return left(
        SembastFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteHoliday({Holiday holiday}) async {
    getLogger(this.runtimeType.toString()).d('deleteHoliday');
    try {
      await holidaysLocalDataSource.deleteHoliday(
        holidayDto: HolidayDto.fromDomain(holiday),
      );
      return right(unit);
    } on Exception {
      return left(SembastFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> addDeleteHoliday({Holiday holiday}) async {
    getLogger('HolidaysRepositoryImpl').d('addDeleteHoliday');
    try {
      await holidaysLocalDataSource.addDeleteHoliday(
        holidayDto: HolidayDto.fromDomain(holiday),
      );
      return right(unit);
    } on Exception {
      return left(
        SembastFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, Map<DateTime, List<Holiday>>>> getHolidays(
      {Year year}) async {
    getLogger(this.runtimeType.toString()).d('getHolidays');
    Map<DateTime, List<Holiday>> holidays;
    try {
      List<HolidayDto> holidaysDto =
          await holidaysLocalDataSource.getHolidays(year: year.getOrCrash());

      holidays = Map.fromIterable(
        holidaysDto,
        key: (e) =>
            DateTime.fromMillisecondsSinceEpoch(e.epochTimeStamp).toUtc(),
        value: (e) => List<Holiday>()
          ..add(
            (e as HolidayDto).toDomain(),
          ),
      );

      return right(holidays);
    } on Exception {
      return left(SembastFailure());
    }
  }
}
//
//class ConverterParamIntoHoliday {
//  Holiday convertingToHoliday(HolidaysParam param) {
//    Holiday holiday = Holiday(
//        hours: param.hours,
//        chosenYear: param.year,
//        epochTimeStamp: param.dateTime.millisecondsSinceEpoch);
//    return holiday;
//  }
//}
