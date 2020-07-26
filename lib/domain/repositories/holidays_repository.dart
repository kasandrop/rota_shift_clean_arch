/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 11:47
 *
 */

import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:rotashiftcleanarch/core/error/failures.dart';
import 'package:rotashiftcleanarch/domain/entities/holiday.dart';
import 'package:rotashiftcleanarch/domain/value_objects/input_to_entities.dart';

abstract class HolidaysRepository {
  Future<Either<Failure, Map<DateTime, List<Holiday>>>> getHolidays(
      {@required Year year});

  Future<Either<Failure, Unit>> createHoliday({@required Holiday holiday});

  Future<Either<Failure, Unit>> deleteHoliday({Holiday holiday});

  Future<Either<Failure, Unit>> addDeleteHoliday({Holiday holiday});
}
