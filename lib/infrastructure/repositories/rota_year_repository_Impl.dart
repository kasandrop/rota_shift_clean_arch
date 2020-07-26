/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 11:47
 *
 */

import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:rotashiftcleanarch/core/error/exception.dart';
import 'package:rotashiftcleanarch/core/error/failures.dart';
import 'package:rotashiftcleanarch/core/util/simple_log_printer.dart';
import 'package:rotashiftcleanarch/domain/repositories/rota_year_repository.dart';
import 'package:rotashiftcleanarch/domain/value_objects/rota_year.dart';
import 'package:rotashiftcleanarch/infrastructure/datasources/abstractions/rota_year_local_data_source.dart';

class RotaYearRepositoryImpl implements RotaYearRepository {
  final log = getLogger('RotaYearRepositoryImpl');

  final RotaYearLocalDataSource localDataSource;

  RotaYearRepositoryImpl({
    @required this.localDataSource,
  }) {
    log.d('RotaYearRepositoryImpl()');
  }

  @override
  Future<Either<NoDataCacheFailure, RotaYear>> getCurrentRotaYear() async {
    log.d('getCurrentRotaYear()');
    try {
      final RotaYear rotaYear = await localDataSource.getRotaYear();
      return Right(rotaYear);
    } on NoDataCacheException {
      return Left(NoDataCacheFailure());
    }
  }

  @override
  Future<void> saveRotaYear({RotaYear rotaYear}) async {
    log.d('saveRotaYear');
    return await localDataSource.cacheRotaYear(
      rotaYear: rotaYear,
    );
  }
}
