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
import 'package:rotashiftcleanarch/core/util/simple_log_printer.dart';
import 'package:rotashiftcleanarch/domain/repositories/rota_year_repository.dart';
import 'package:rotashiftcleanarch/domain/usecases/Params/param.dart';
import 'package:rotashiftcleanarch/domain/value_objects/rota_year.dart';

import 'get_current_rota_year.dart';

//this is configuration use case. If there is no default RotaYear
// it makes sure that data will be there as default
//TODO: instead using Param(rota: year:) use RotaYear entity
//TODO: instead of returning void return Unit

class CreateRotaYearIfDoesNotExistUseCase {
  final log = getLogger('SetupRotaYearType');
  final GetCurrentRotaYear getCurrentRotaYear;
  final RotaYearRepository repository;
  final RotaYear defaultRotaYear;

  CreateRotaYearIfDoesNotExistUseCase(
      {@required this.getCurrentRotaYear,
      @required this.repository,
      @required this.defaultRotaYear}) {
    log.d('new  SetupRotaYearType()');
  }

//TODO:check if this function return RotaYear

  Future<Map<String, int>> saveDefaultOrJustCreateRotaYear() async {
    log.d('getSavedOrJustCreatedRotaYear()');
    //RotaYear newRotaYear;
    Either<NoDataCacheFailure, RotaYear> data = await getCurrentRotaYear(NoParam());
    Map<String, int> toReturn = await data.fold((ifLeft) async {
      log.d('setup config shows failure thats why  it saves default RotaYear');
      await repository.saveRotaYear(
        rotaYear: defaultRotaYear,
      );
      getLogger('defaultRotaYear').d(defaultRotaYear);
      Map<String, int> toReturn1 = {
        'rota': defaultRotaYear.rota.getOrCrash(),
        'year': defaultRotaYear.year.getOrCrash()
      };
      return toReturn1;
    }, (ifRight) async {
      log.d('setup config shows everything is setup');
      Map<String, int> toReturn2 = {
        'rota': ifRight.rota.getOrCrash(),
        'year': ifRight.year.getOrCrash()
      };
      return toReturn2;
      //  newRotaYear = ifRight;
    });
    getLogger('saveDefaultOrJustCreateRotaYear').d(toReturn);
    return toReturn;
  }
}
