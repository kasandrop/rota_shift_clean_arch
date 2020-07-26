/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 11:47
 *
 */
import 'package:meta/meta.dart';
import 'package:rotashiftcleanarch/core/error/exception.dart';
import 'package:rotashiftcleanarch/core/util/simple_log_printer.dart';
import 'package:rotashiftcleanarch/domain/entities/day_off.dart';
import 'package:rotashiftcleanarch/domain/helpers/default_year.dart';
import 'package:rotashiftcleanarch/domain/value_objects/rota_year.dart';
import 'package:rotashiftcleanarch/infrastructure/datasources/abstractions/annual_days_off_local_data_source.dart';
import 'package:rotashiftcleanarch/infrastructure/dtos/day_off_dto.dart';
import 'package:sqflite/sqflite.dart';

class DaysOffLocalDbProvider implements AnnualDaysOffLocalDataSource {
  final log = getLogger('DaysOffLocalDbProvider ');
  final Database database;

  DaysOffLocalDbProvider({
    this.database,
  }) {
    log.d('DaysOffLocalDbProvider()');
  }

  @override
  Future<bool> checkIfDateExist({
    @required RotaYear rotaYear,
    @required int dateTimeYear,
    @required int dateTimeDoY,
  }) async {
    log.d('checkIfDateExist()');
    int yearLookUp = rotaYear.year.getOrCrash();
    int rotaLookUp = rotaYear.rota.getOrCrash();
    final lists = await database.query(
      "RotaCalendar",
      distinct: true,
      columns: ["id", "dayNumber", "year", "rota"],
      where: " chosenYear=? AND rota=? AND dayNumber=? AND year=? ",
      whereArgs: [yearLookUp, rotaLookUp, dateTimeDoY, dateTimeYear],
    );
    final bool isData = (lists.length > 0) ? true : false;
    log.d('checkIfDateExist()-response:  $isData');
    if (isData) {
      return true;
    }
    return false;
  }

  //extra field chosenYear is the working year from 1st March chosenYear till 31st March chosenYear+1

  @override
  Future<void> cacheAnnualDaysOff({
    @required Map<DateTime, List<DayOff>> daysOff,
  }) async {
    // TODO: implement cacheAnnualDaysOff
    log.d('cacheAnnualDaysOff() ');
    daysOff.forEach((DateTime key, List<DayOff> value) async {
      await database.insert(
        "RotaCalendar",
        //(value.first.toJson()),
        (DayOffDto.fromDomain(dayOff: value.first)).toJson(),
        conflictAlgorithm: ConflictAlgorithm.ignore,
      );
    });
  }

  @override
  Future<Map<DateTime, List<DayOff>>> getAnnualDaysOff(
      {RotaYear rotaYear}) async {
    int yearLookUp = rotaYear.year.getOrCrash();
    int rotaLookUp = rotaYear.rota.getOrCrash();
    log.d('getAnnualDaysOff() ');
    Map<DateTime, List<DayOff>> mapToReturn = {};
    final List<Map<String, dynamic>> list = await database.query(
      "RotaCalendar",
      distinct: true,
      columns: ["id", "dayNumber", "year", "rota", "chosenYear"],
      where: " chosenYear=? AND rota=? ",
      whereArgs: [yearLookUp, rotaLookUp],
    );
    log.d('getAnnualDaysOff()  after query ${list.length}');
    if (list.length == 0) {
      throw CacheException();
    }
    for (Map<String, dynamic> map in list) {
      DayOffDto dayOffDto = DayOffDto.fromJson(map);
      //TODO:Remove the helper maybe extension
      DateTime dt = Helper.getDateTimeFromDayNumber(
        dayOffDto.dayNumber,
        dayOffDto.year,
      );
      mapToReturn[dt] = [dayOffDto.toDomain()];
    }
    log.i('lenght:::::${mapToReturn.length}');
    return mapToReturn;
  }
}
