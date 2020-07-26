/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 11:47
 *
 */

import 'package:flutter/material.dart';
import 'package:rotashiftcleanarch/core/error/exception.dart';
import 'package:rotashiftcleanarch/domain/value_objects/rota_year.dart';

abstract class RotaYearLocalDataSource {
  ///gets the cached [RotaYear]
  ///
  /// throws [ NoDataCacheException] if cache data is not present
  Future<RotaYear> getRotaYear();

  Future<void> cacheRotaYear({@required RotaYear rotaYear});
}
