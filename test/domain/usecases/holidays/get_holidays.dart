/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 11:47
 *
 */

import 'package:dartz/dartz.dart';
import 'package:rotashiftcleanarch/core/domain/usecase.dart';
import 'package:rotashiftcleanarch/core/error/failures.dart';
import 'package:rotashiftcleanarch/domain/entities/holiday.dart';
import 'package:rotashiftcleanarch/domain/repositories/holidays_repository.dart';
import 'package:rotashiftcleanarch/domain/value_objects/input_to_entities.dart';

class GetHolidays extends UseCase<Map<DateTime, List<Holiday>>, Year> {
  final HolidaysRepository holidaysRepository;

  GetHolidays({this.holidaysRepository});

  @override
  Future<Either<Failure, Map<DateTime, List<Holiday>>>> call(Year year) async {
    return await holidaysRepository.getHolidays(year: year);
  }
}
