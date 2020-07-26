/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 11:47
 *
 */

import 'dart:convert';

import 'package:rotashiftcleanarch/core/error/exception.dart';
import 'package:rotashiftcleanarch/core/util/simple_log_printer.dart';
import 'package:rotashiftcleanarch/domain/value_objects/rota_year.dart';
import 'package:rotashiftcleanarch/infrastructure/datasources/abstractions/rota_year_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

const CACHED_ROTA_YEAR = 'CACHED_ROTA_YEAR';

class RotaYearLocalDataSourceImpl implements RotaYearLocalDataSource {
  final SharedPreferences sharedPreferences;
  final log = getLogger('RotaYearLocalDataSourceImpl');

  RotaYearLocalDataSourceImpl({this.sharedPreferences}) {
    log.d('new RotaYearLocalDataSourceImpl()');
  }

  @override
  Future<void> cacheRotaYear({RotaYear rotaYear}) {
    //TODO it is called  2 times at first 2 events
    log.d('cacheRotaYear() + ${json.encode(rotaYear.toMap())}');
    return sharedPreferences.setString(
      CACHED_ROTA_YEAR,
      json.encode(rotaYear.toMap()),
    );
  }

  @override
  Future<RotaYear> getRotaYear() {
    log.d('getRotaYear()');
    final jsonString = sharedPreferences.getString('CACHED_ROTA_YEAR');
    if (jsonString != null) {
      return Future.value(RotaYear.fromJson(json.decode(jsonString)));
    } else {
      throw NoDataCacheException();
    }
  }
}
