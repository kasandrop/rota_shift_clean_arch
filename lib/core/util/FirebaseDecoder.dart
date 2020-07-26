/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 11:47
 *
 */
import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:rotashiftcleanarch/core/util/simple_log_printer.dart';
import 'package:rotashiftcleanarch/domain/entities/day_off.dart';
import 'package:rotashiftcleanarch/domain/helpers/default_year.dart';
import 'package:rotashiftcleanarch/domain/value_objects/rota_year.dart';
import 'package:rotashiftcleanarch/infrastructure/dtos/day_off_dto.dart';

final logger = getLogger('FirebaseDecoder');

class FirebaseDecoder
    extends Converter<RotaYearMapParam, Map<DateTime, List<DayOff>>> {
  const FirebaseDecoder();

  @override
  convert(RotaYearMapParam rotaYearMapParam) {
    Map input = rotaYearMapParam.mapToProcess;
    int rotaParam = rotaYearMapParam.rotaYear.rota.getOrCrash();
    int yearParam = rotaYearMapParam.rotaYear.year.getOrCrash();
    Map<DateTime, List<DayOff>> map = input.map((key, value) {
      DayOffDto dayOffDto = DayOffDto.fromFirebase(
          id: key as String,
          parsedJson: value,
          rota: rotaParam,
          chosenYear: yearParam);
      DateTime datetime = Helper.getDateTimeFromDayNumber(
        dayOffDto.dayNumber,
        dayOffDto.year,
      );
      return MapEntry(datetime, List<DayOff>()..add(dayOffDto.toDomain()));
    });

    return map;
  }
}

@immutable
class RotaYearMapParam {
  final RotaYear rotaYear;
  final Map mapToProcess;

  RotaYearMapParam({
    @required this.rotaYear,
    @required this.mapToProcess,
  });
}
