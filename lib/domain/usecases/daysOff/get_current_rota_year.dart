/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 11:47
 *
 */

//under the hood it will save the changed rota as well
//still thinking if it is necessary to implement new use case.
// so decision is: instead of creating this new use case
// I will save locally (type or class )  RotaYear whenever user changes one of the properties
// year or rota

import 'package:dartz/dartz.dart';
import 'package:rotashiftcleanarch/core/domain/usecase.dart';
import 'package:rotashiftcleanarch/core/error/failures.dart';
import 'package:rotashiftcleanarch/core/util/simple_log_printer.dart';
import 'package:rotashiftcleanarch/domain/repositories/rota_year_repository.dart';
import 'package:rotashiftcleanarch/domain/usecases/Params/param.dart';
import 'package:rotashiftcleanarch/domain/value_objects/rota_year.dart';

class GetCurrentRotaYear extends UseCase<RotaYear, NoParam> {
  final log = getLogger('GetCurrentRotaYear-usecase');
  final RotaYearRepository repository;

  GetCurrentRotaYear({this.repository}) {
    log.d('new GetCurrentRotaYear()');
  }

  @override
  Future<Either<NoDataCacheFailure, RotaYear>> call(NoParam params) async {
    log.d('call(NoParams params)');
    return await repository.getCurrentRotaYear();
  }
}
