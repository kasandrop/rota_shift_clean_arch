/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 11:47
 *
 */

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:rotashiftcleanarch/core/error/failures.dart';
import 'package:rotashiftcleanarch/domain/entities/day_off.dart';
import 'package:rotashiftcleanarch/domain/usecases/Params/param.dart';
import 'package:rotashiftcleanarch/domain/value_objects/rota_year.dart';

// Future<Either<Failure, Map<DateTime,List<String>>>>
//  getAnnualDaysOff(RotaYear rotaYear);
abstract class AnnualDaysOffRepository {
  //Future<Either<Failure, List<DayOff>>> getAnnualDaysOff({int rota, int year});

  //The rewaso not to use entities as transfer object : clean architecture are:
  //1 Because Objects are immutable
  // I cannot create Object DayOffModel because I do not know the firebase_key yes
  //that is why I will have my own dto = InputParam
  Future<Either<Failure, String>> insertDayOffIntoCloud(
      {@required InsertParam insertParam});

  Future<Either<Failure, Map<DateTime, List<DayOff>>>> getAnnualDaysOff({
    @required RotaYear rotaYear,
  });
}
