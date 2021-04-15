/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 11:47
 *
 */
//
//import 'package:dartz/dartz.dart';
//import 'package:freezed_annotation/freezed_annotation.dart';
//import 'package:rotashiftcleanarch/core/domain/entity.dart';
//import 'package:rotashiftcleanarch/core/domain/failures.dart';
//import 'package:rotashiftcleanarch/core/domain/value_object.dart';
//import 'package:rotashiftcleanarch/domain/value_objects/input_to_entities.dart';
//
//part 'day_off.freezed.dart';
//
//@freezed
//abstract class DayOff with _$DayOff implements IEntity {
//  const factory DayOff({
//    @required UniqueId id, //to create a new id we use UniqueId id=UniqueId()
//    @required Rota rota,
//    @required Year year,
//    @required DayNumber dayNumber,
//  }) = _DayOff;
//}
//
//extension DayOffX on DayOff {
//  Option<ValueFailure<dynamic>> get failureOption {
//    return rota.failureOrUnit
//        .andThen(year.failureOrUnit)
//        .andThen(dayNumber.failureOrUnit)
//        .fold(
//          (l) => some(l),
//          (_) => none(),
//        );
//  }
//}
