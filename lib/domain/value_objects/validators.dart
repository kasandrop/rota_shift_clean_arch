/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 11:47
 *
 */

import 'package:dartz/dartz.dart';
import 'package:rotashiftcleanarch/core/domain/failures.dart';

Either<ValueFailure<int>, int> validateRota(int input) {
  if (input > 0 && input <= 7) {
    return Right(input);
  } else {
    return Left(ValueFailure.invalidRota(failedValue: input));
  }
}

Either<ValueFailure<int>, int> validateYear(int input) {
  //TODO hardcoded max year
  if (input >= 2000 && input <= 2100) {
    return Right(input);
  } else {
    return Left(ValueFailure.invalidYear(failedValue: input));
  }
}

Either<ValueFailure<int>, int> validateDayNumber(int input) {
  if (input >= 1 && input <= 366) {
    return Right(input);
  } else {
    return Left(ValueFailure.invalidDayNumber(failedValue: input));
  }
}
