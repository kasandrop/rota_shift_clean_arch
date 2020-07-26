/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 12:02
 *
 */

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:rotashiftcleanarch/core/domain/value_object.dart';
import 'package:rotashiftcleanarch/domain/entities/day_off.dart';
import 'package:rotashiftcleanarch/domain/helpers/default_year.dart';
import 'package:rotashiftcleanarch/domain/value_objects/input_to_entities.dart';

part 'day_off_dto.freezed.dart';

part 'day_off_dto.g.dart';

@freezed
abstract class DayOffDto with _$DayOffDto {
  //TODO: check id how is created local database is different logic
  const factory DayOffDto({
    //@required @JsonKey(name: 'key') String id,
    @required String id,
    @required int dayNumber,
    @required int year,
    @required int rota,
    @required int chosenYear,
  }) = _DayOffDto;

  factory DayOffDto.fromDomain({@required DayOff dayOff}) {
    int dn = dayOff.dayNumber.getOrCrash();
    int ye = dayOff.year.getOrCrash();
    int ro = dayOff.rota.getOrCrash();
    return DayOffDto(
        id: dayOff.id.getOrCrash(),
        dayNumber: dn,
        year: ye,
        rota: ro,
        chosenYear: Helper.getLookUpYearFromDayNumber(dn, ye));
  }

  factory DayOffDto.fromFirebase({
    @required String id,
    @required Map<String, dynamic> parsedJson,
    @required int rota,
    @required int chosenYear,
  }) {
    return DayOffDto(
      id: id,
      dayNumber: int.parse(parsedJson['dayNumber']),
      year: int.parse(parsedJson['year']),
      rota: rota,
      chosenYear: chosenYear,
    );
  }

  factory DayOffDto.fromJson(Map<String, dynamic> json) =>
      _$DayOffDtoFromJson(json);
}

extension DayOffDtoX on DayOffDto {
  DayOff toDomain() {
    return DayOff(
      id: UniqueId.fromUniqueString(id),
      dayNumber: DayNumber(dayNumber),
      year: Year(year),
      rota: Rota(rota),
    );
  }
}
//}
//
//class DayOffModel extends DayOff {
//  // final int key;
//  final String key_firebase;
//
//  //needed in order to enable search capability. It is chosen from widget
//  final int chosenYear;
//
//
//
//  DayOffModel({
//    // @required this.key,
//    @required this.key_firebase,
//    @required dayNumber,
//    @required year,
//    @required rota,
//    @required this.chosenYear,
//  }) : super(
//          // key: key,
//          dayNumber: dayNumber,
//          year: year,
//          rota: rota,
//          // chosenYear: chosenYear,
//        ) {
//    //   logger.d('new DayOffModel()');
//  }
//
//  DayOffModel.fromFirebase({
//    //@required this.key,
//    @required this.key_firebase,
//    @required Map<String, dynamic> parsedJson,
//    @required int rota,
//    @required this.chosenYear,
//  }) :
////        key = createPrimaryKey(
////            dayNumber: int.parse(parsedJson['dayNumber']),
////            year: int.parse(parsedJson['year']),
////            rota: rota),
//        super(
//          dayNumber: int.parse(parsedJson['dayNumber']),
//          year: int.parse(parsedJson['year']),
//          rota: rota,
//          // chosenYear: chosenYear,
//        ) {}
//
//  DayOffModel.fromDb({
//    @required Map<String, dynamic> parsedJson,
//  })  : //key = parsedJson['key'],
//        key_firebase = parsedJson['key_firebase'],
//        chosenYear = parsedJson['chosenYear'],
//        super(
//          dayNumber: parsedJson['dayNumber'],
//          year: parsedJson['year'],
//          rota: parsedJson['rota'],
//          // chosenYear: chosenYear,
//        ) {}
//
//  ///the same year and dayNumber as in [DayOffModel]
////  static int createPrimaryKey({
////    @required int year,
////    @required int dayNumber,
////    @required int rota,
////  }) {
////    String y = year.toString();
////    String d = dayNumber.toString();
////    String r = rota.toString();
////    final String strPk = '$y$r$d';
////    return int.parse(strPk);
////  }
//
//  @override
//  String toString() {
//    return 'DayOffModel{'
//        ' key_firebase: $key_firebase,'
//        ' dayNumber: $dayNumber,'
//        ' year: $year,'
//        ' rota: $rota,'
//        ' chosenYear: $chosenYear,'
//        ' }';
//  }
//
//  Map<String, dynamic> toMap() {
////    Logger().d('DayOffModel  Map<String,dynamic> toMap()');
//    return {
//      'key_firebase': key_firebase,
//      'dayNumber': dayNumber,
//      'year': year,
//      'rota': rota,
//      'chosenYear': chosenYear,
//    };
//  }
//
////this function goes inside insert
//// i have to convert it from string
//  @override
//  // TODO: implement props
//  List<Object> get props => [
//        key_firebase,
//        dayNumber,
//        year,
//        rota,
//        chosenYear,
//      ];
//}
