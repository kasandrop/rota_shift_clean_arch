/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 11:47
 *
 */

import 'package:flutter/material.dart';
import 'package:rotashiftcleanarch/core/error/exception.dart';
import 'package:rotashiftcleanarch/domain/entities/day_off.dart';
import 'package:rotashiftcleanarch/domain/value_objects/rota_year.dart';

abstract class AnnualDaysOffRemoteDataSource {
  /// Calls the
  /// https://calendar-3b3fa.firebaseio.com/rotas/2018/rota1.json{year}/{rota}
  /// endpoint.
  ///
  /// Throws a [ServerException] if any problem with the server .It means  response.status code!=200
  /// Throws a [NoDataServerException] if there is no data returned

  Future<Map<DateTime, List<DayOff>>> getAnnualDaysOff({
    @required RotaYear rotaYear,
  });

  /// Throws an [InsertException ] if there is no data returned

  ///Throws [InsertError] if there is any error with inserting date to a database

  Future<String> insertDayOffIntoCloud({
    @required RotaYear rotaYear,
    @required int dateTimeYear,
    @required int dateTimeDoY,
  });
}
