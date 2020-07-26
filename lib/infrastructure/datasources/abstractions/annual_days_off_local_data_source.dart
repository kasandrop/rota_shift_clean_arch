/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 11:47
 *
 */

import 'package:meta/meta.dart';
import 'package:rotashiftcleanarch/core/error/exception.dart';
import 'package:rotashiftcleanarch/domain/entities/day_off.dart';
import 'package:rotashiftcleanarch/domain/value_objects/rota_year.dart';

abstract class AnnualDaysOffLocalDataSource {
  /// Throws [CacheException] if no cached data is present.
  ///
  ///
  ///
  //TODO: shall i use dto instead just dayOf or Dayoffdto
  Future<Map<DateTime, List<DayOff>>> getAnnualDaysOff({
    @required RotaYear rotaYear,
  });

  Future<void> cacheAnnualDaysOff({
    @required Map<DateTime, List<DayOff>> daysOff,
  });

  Future<bool> checkIfDateExist({
    @required RotaYear rotaYear,
    @required int dateTimeYear,
    @required int dateTimeDoY,
  });
}
