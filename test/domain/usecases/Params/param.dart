/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 11:47
 *
 */

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rotashiftcleanarch/core/util/simple_log_printer.dart';
import 'package:rotashiftcleanarch/domain/entities/holiday.dart';
import 'package:rotashiftcleanarch/domain/value_objects/input_to_entities.dart';
import 'package:rotashiftcleanarch/domain/value_objects/rota_year.dart';

//class Param extends Equatable {
//  final Rota rota;
//  final Year year;
//  final logger = getLogger('Param');
//
//  Param({
//    @required this.rota,
//    @required this.year,
//  }) {
//    logger.d('Param()');
//  }
//
//  @override
//  List<Object> get props => [rota, year];
//
//  @override
//  String toString() {
//    return 'Param{rota: $rota, year: $year}';
//  }
//}

class NoParam extends Equatable {
  @override
  List<Object> get props => [Object];
}

class HolidaysHoursParam extends Equatable {
  final int hours;
  final Holiday holiday;

  const HolidaysHoursParam({this.hours, this.holiday});

  @override
  List<Object> get props => [hours, holiday];
}

class InsertParam extends Equatable {
  final RotaYear rotaYear;
  final int dateTimeYear;
  final DayNumber dateTimeDoY;
  final logger = getLogger('InsertParam');

  InsertParam({
    @required this.rotaYear,
    @required this.dateTimeYear,
    @required this.dateTimeDoY,
  }) {
    logger.d('InsertParam()');
  }

  @override
  List<Object> get props => [rotaYear, dateTimeYear, dateTimeDoY];

  @override
  String toString() {
    return 'InsertParam{ dateTimeYear: $dateTimeYear, '
        'dateTimeDoY: $dateTimeDoY}';
  }
}
