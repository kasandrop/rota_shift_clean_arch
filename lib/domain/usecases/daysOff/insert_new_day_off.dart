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
import 'package:rotashiftcleanarch/domain/repositories/annual_days_off_repository.dart';
import 'package:rotashiftcleanarch/domain/usecases/Params/param.dart';

class InsertDayOffIntoCloud extends UseCase<String, InsertParam> {
  final log = getLogger('InsertDayOffIntoCloud-usecase');
  final AnnualDaysOffRepository repository;

  InsertDayOffIntoCloud({this.repository}) {
    log.d('InsertDayOffIntoCloud()');
  }

  @override
  Future<Either<Failure, String>> call(InsertParam insertParam) async {
    log.d('call   InsertDayOffIntoCloud usecase');
    return await repository.insertDayOffIntoCloud(
      insertParam: insertParam,
    );
  }
}
