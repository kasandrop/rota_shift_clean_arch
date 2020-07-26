/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 11:47
 *
 */

import "dart:convert";

import "package:http/http.dart" as http;
import "package:meta/meta.dart";
import "package:rotashiftcleanarch/core/error/exception.dart";
import 'package:rotashiftcleanarch/core/util/FirebaseDecoder.dart';
import "package:rotashiftcleanarch/core/util/simple_log_printer.dart";
import 'package:rotashiftcleanarch/domain/entities/day_off.dart';
import 'package:rotashiftcleanarch/domain/value_objects/rota_year.dart';
import 'package:rotashiftcleanarch/infrastructure/datasources/abstractions/annual_days_off_remote_data_source.dart';

///TODO: hard coded _root
//TODO shall i use dayofdto or dayoff
//This is wrong data providers should accept and return DTOs. it needs to be corrected
class DaysOffRemoteApiProvider implements AnnualDaysOffRemoteDataSource {
  String _root = "https://calendar-3b3fa.firebaseio.com/rotas/";
  final http.Client client;
  final log = getLogger("DaysOffRemoteApiProvider");
  final FirebaseDecoder firebaseDecoder;

  DaysOffRemoteApiProvider({
    @required this.client,
    @required this.firebaseDecoder,
  }) {
    log.d(" new DaysOffRemoteApiProvider()");
  }

  @override
  Future<Map<DateTime, List<DayOff>>> getAnnualDaysOff({
    @required RotaYear rotaYear,
  }) async {
    log.d("getAnnualDaysOff   ${rotaYear}");
    var r = rotaYear.rota.getOrCrash().toString();
    var y = rotaYear.year.getOrCrash().toString();

    log.d("link:$_root" + "$y/rota$r.json");
    http.Response response = await http.get(_root + "$y/rota$r.json");
    if (response.statusCode != 200) {
      throw ServerException();
    }
    Map<DateTime, List<DayOff>> mapToReturn;

    RotaYearMapParam rotaYearMapParam = RotaYearMapParam(
      rotaYear: rotaYear,
      mapToProcess: json.decode(response.body) ?? {},
    );

    mapToReturn = firebaseDecoder.convert(rotaYearMapParam);

    return mapToReturn;
    //return values;
  }

  @override
  Future<String> insertDayOffIntoCloud({
    @required RotaYear rotaYear,
    @required int dateTimeYear,
    @required int dateTimeDoY,
  }) async {
    int yearLookUp = rotaYear.year.getOrCrash();
    int rotaLookUp = rotaYear.rota.getOrCrash();
    log.d("insertDayOffIntoCloud()");
    String _url = _root + "$yearLookUp/rota$rotaLookUp.json";
    String _dayNumber = dateTimeDoY.toString();
    String _year = dateTimeYear.toString();
    dynamic mapToJson = {
      "dayNumber": "$_dayNumber",
      "year": "$_year",
    };
    var response = await http.post(
      _url,
      body: jsonEncode(mapToJson),
    );
    log.d("URL: $_url");
    log.d("Response status code of Post request: ${response.statusCode}");
    log.d("Response body    of Post request: ${response.body}");
    if (response.statusCode != 200) {
      Map responseBody = json.decode(response.body);
      String text = responseBody['error'] ?? 'Unknown Error at inserting';
      throw InsertException(message: text);
    }
    // TODO: implement insertDayOffIntoCloud
    return response.body;
  }
}
