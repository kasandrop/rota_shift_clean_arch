/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 11:47
 *
 */
import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:rotashiftcleanarch/infrastructure/dtos/holiday_dto.dart';

/// Throws [CacheException] if no cached data is present.
abstract class HolidaysLocalDataSource {
  Future<List<HolidayDto>> getHolidays({int year});

  Future<Unit> createHoliday({HolidayDto holidayDto});

  Future<Unit> deleteHoliday({HolidayDto holidayDto});

  Future<Unit> addDeleteHoliday({HolidayDto holidayDto});
}
