/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 11:47
 *
 */
//
//import 'package:dartz/dartz.dart';
//import 'package:rotashiftcleanarch/core/domain/usecase.dart';
//import 'package:rotashiftcleanarch/core/error/failures.dart';
//import 'package:rotashiftcleanarch/core/util/simple_log_printer.dart';
//import 'package:rotashiftcleanarch/features/days_off/domain/entities/holiday.dart';
//import 'package:rotashiftcleanarch/features/days_off/domain/repositories/holidays_repository.dart';
//
//class DeleteHoliday extends UseCase<Unit, Holiday> {
//  final HolidaysRepository repository;
//
//  DeleteHoliday({this.repository}) {
//    getLogger(this.runtimeType.toString()).d('DeleteHoliday');
//  }
//
//  @override
//  Future<Either<Failure, Unit>> call(Holiday holiday) async {
//    getLogger(this.runtimeType.toString()).d('call');
//    return repository.deleteHoliday(holiday: holiday);
//  }
//}
