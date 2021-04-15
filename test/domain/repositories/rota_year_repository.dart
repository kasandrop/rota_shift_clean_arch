/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 11:47
 *
 */

import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:rotashiftcleanarch/core/error/failures.dart';
import 'package:rotashiftcleanarch/domain/value_objects/rota_year.dart';

abstract class RotaYearRepository {
  Future<Either<NoDataCacheFailure, RotaYear>> getCurrentRotaYear();

  Future<void> saveRotaYear({
    @required RotaYear rotaYear,
  });
}
