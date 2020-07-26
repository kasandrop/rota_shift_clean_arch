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
import 'package:rotashiftcleanarch/core/util/simple_log_printer.dart';
import 'package:rotashiftcleanarch/domain/entities/day_off.dart';
import 'package:rotashiftcleanarch/domain/repositories/annual_days_off_repository.dart';
import 'package:rotashiftcleanarch/domain/repositories/rota_year_repository.dart';
import 'package:rotashiftcleanarch/domain/value_objects/rota_year.dart';

class GetAnnualDaysOff extends UseCase<Map<DateTime, List<DayOff>>, RotaYear> {
  final logger = getLogger('GetAnnualDaysOff usecase');
  final AnnualDaysOffRepository repositoryAnnualDaysOff;
  final RotaYearRepository repositoryRotaYear;

  GetAnnualDaysOff({
    this.repositoryAnnualDaysOff,
    this.repositoryRotaYear,
  }) {
    logger.d('new  GetAnnualDaysOff()');
  }

  @override
  Future<Either<Failure, Map<DateTime, List<DayOff>>>> call(
    RotaYear rotaYear,
  ) async {
    logger.d('GetAnnualDaysOff usecase called with'
        '\n rotaYear: $rotaYear');
    //logger.d('new rota=$rota and new year=$year');
    await repositoryRotaYear.saveRotaYear(
      rotaYear: rotaYear,
    );
    return repositoryAnnualDaysOff.getAnnualDaysOff(
      rotaYear: rotaYear,
    );
  }
}
