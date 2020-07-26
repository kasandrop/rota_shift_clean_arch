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
import 'package:rotashiftcleanarch/core/network/network_info.dart';
import 'package:rotashiftcleanarch/core/util/simple_log_printer.dart';
import 'package:rotashiftcleanarch/domain/entities/day_off.dart';
import 'package:rotashiftcleanarch/domain/repositories/annual_days_off_repository.dart';
import 'package:rotashiftcleanarch/domain/usecases/Params/param.dart';
import 'package:rotashiftcleanarch/domain/value_objects/rota_year.dart';
import 'package:rotashiftcleanarch/infrastructure/datasources/abstractions/annual_days_off_local_data_source.dart';
import 'package:rotashiftcleanarch/infrastructure/datasources/abstractions/annual_days_off_remote_data_source.dart';

class AnnualDaysOffRepositoryImpl implements AnnualDaysOffRepository {
  final log = getLogger('AnnualDaysOffRepositoryImpl');
  final AnnualDaysOffRemoteDataSource remoteDaysOffDataSource;
  final AnnualDaysOffLocalDataSource localDaysOffDataSource;
  final NetworkInfo networkInfo;

  AnnualDaysOffRepositoryImpl({
    this.remoteDaysOffDataSource,
    this.localDaysOffDataSource,
    this.networkInfo,
  }) {
    log.d('AnnualDaysOffRepositoryImpl()');
  }

  @override
  Future<Either<Failure, Map<DateTime, List<DayOff>>>> getAnnualDaysOff({
    @required RotaYear rotaYear,
  }) async {
    // TODO: implement getAnnualDaysOffNewVersion
    log.d(' getAnnualDaysOff ${rotaYear.toString()} ');
    try {
      final Map<DateTime, List<DayOff>> localDaysOff = await this
          .localDaysOffDataSource
          .getAnnualDaysOff(rotaYear: rotaYear);
      return Right(localDaysOff);
    } on CacheException {
      return _getRemoteDaysOffAndSaveLocally(
        rotaYear: rotaYear,
      );
    }
  }

  /// not handled [NoInternetFailure] may ne raised here
  Future<Either<Failure, Map<DateTime, List<DayOff>>>>
      _getRemoteDaysOffAndSaveLocally({
    @required RotaYear rotaYear,
  }) async {
    log.d('_getRemoteDaysOffAndSaveLocally');
    bool isConnected = await networkInfo.isConnected;
    if (isConnected == false) {
      return Left(NoInternetFailure());
    }
    Map<DateTime, List<DayOff>> remoteDaysOff;
    try {
      remoteDaysOff = await this.remoteDaysOffDataSource.getAnnualDaysOff(
            rotaYear: rotaYear,
          );
    } on ServerException {
      return Left(ServerFailure());
    } on NoDataServerException {
      return Left(NoDataServerFailure());
    } on Exception catch (e) {
      print('catching');
      print(e.toString());
    }
    await localDaysOffDataSource.cacheAnnualDaysOff(daysOff: remoteDaysOff);
    return Right(remoteDaysOff);
  }

/*
  Future<Either<Failure, List<DayOffModel>>> getAnnualDaysOffNewVersion(
      {int rota, int year}) async {

  }
*/
  @override
  Future<Either<Failure, String>> insertDayOffIntoCloud(
      {@required InsertParam insertParam}) async {
    log.d('insertDayOffIntoCloud()');

    if (await this.localDaysOffDataSource.checkIfDateExist(
          rotaYear: insertParam.rotaYear,
          dateTimeDoY: insertParam.dateTimeDoY.getOrCrash(),
          dateTimeYear: insertParam.dateTimeYear,
        )) {
      return Left(InsertDayOffExistsFailure());
    }
    bool isConnected = await networkInfo.isConnected;
    if (isConnected == false) {
      return Left(NoInternetFailure());
    }
    try {
      final String test =
          await this.remoteDaysOffDataSource.insertDayOffIntoCloud(
                rotaYear: insertParam.rotaYear,
                dateTimeDoY: insertParam.dateTimeDoY.getOrCrash(),
                dateTimeYear: insertParam.dateTimeYear,
              );

      return Right(test);
    } on InsertException catch (e) {
      return Left(InsertFailure(message: e.message));
    } on Exception catch (e) {
      print('catching');
      print(e.toString());
      return Left(UnexpectedFailure());
    }
  }
}
