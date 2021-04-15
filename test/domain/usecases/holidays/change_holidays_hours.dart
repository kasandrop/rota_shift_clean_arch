/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 11:47
 *
 */

//import 'package:rotashiftcleanarch/core/domain/usecase.dart';
//
import 'package:dartz/dartz.dart';
import 'package:rotashiftcleanarch/core/domain/usecase.dart';
import 'package:rotashiftcleanarch/core/error/failures.dart';
import 'package:rotashiftcleanarch/core/util/simple_log_printer.dart';
import 'package:rotashiftcleanarch/domain/repositories/holidays_repository.dart';
import 'package:rotashiftcleanarch/domain/usecases/Params/param.dart';

class ChangeHolidaysHours extends UseCase<Unit, HolidaysHoursParam> {
  final HolidaysRepository holidaysRepository;

  ChangeHolidaysHours({this.holidaysRepository});

  @override
  Future<Either<Failure, Unit>> call(HolidaysHoursParam param) async {
    getLogger('ChangeHolidaysHours').d('call');

    await holidaysRepository.deleteHoliday(holiday: param.holiday);

    return await holidaysRepository.createHoliday(
      holiday: param.holiday.copyWith(
        hours: param.hours,
      ),
    );
  }
}
