/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 11:47
 *
 */

import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:rotashiftcleanarch/core/util/simple_log_printer.dart';
import 'package:rotashiftcleanarch/infrastructure/datasources/abstractions/holidays_local_data_source.dart';
import 'package:rotashiftcleanarch/infrastructure/dtos/holiday_dto.dart';
import 'package:sembast/sembast.dart';

//final logger = getLogger('HolidaysLocalSembastProvider');

class HolidaysLocalSembastProvider implements HolidaysLocalDataSource {
  final Database database;
  final StoreRef store;

  const HolidaysLocalSembastProvider({this.database, this.store});

  @override
  Future<Unit> createHoliday({@required HolidayDto holidayDto}) async {
    getLogger(this.runtimeType.toString()).d('createHoliday');

    {
      await store.add(database, holidayDto.toJson());
    }
    return unit;
  }

  Future<bool> _checkIfHolidayExists({@required HolidayDto holidayDto}) async {
    getLogger('HolidaysLocalSembastProvider').d('_checkIfHolidayExists');
    final finder = Finder(
        filter: Filter.equals('epochTimeStamp', holidayDto.epochTimeStamp));
    var holidaySnapshot = await store.find(database, finder: finder);

    return holidaySnapshot.length > 0;
  }

  @override
  Future<Unit> deleteHoliday({@required HolidayDto holidayDto}) async {
    getLogger(this.runtimeType.toString()).d('deleteHoliday');
    final finder = Finder(
        filter: Filter.equals('epochTimeStamp', holidayDto.epochTimeStamp));
    await store.delete(database, finder: finder);
    return unit;
  }

  @override
  Future<List<HolidayDto>> getHolidays({@required int year}) async {
    getLogger(this.runtimeType.toString()).d('getHolidays');
    final finder = Finder(filter: Filter.equals('year', year));
    final holidaysDtoSnapshot = await store.find(database, finder: finder);
    return holidaysDtoSnapshot.map((snapshot) {
      final holidayDto = HolidayDto.fromJson(snapshot.value);
      return holidayDto;
    }).toList();
  }

  @override
  Future<Unit> addDeleteHoliday({@required HolidayDto holidayDto}) async {
    getLogger('HolidaysLocalSembastProvider').d('addDeleteHoliday');
    bool isExisting = await _checkIfHolidayExists(holidayDto: holidayDto);
    if (isExisting == true) {
      return await deleteHoliday(holidayDto: holidayDto);
    } else {
      return await createHoliday(holidayDto: holidayDto);
    }
  }
}
