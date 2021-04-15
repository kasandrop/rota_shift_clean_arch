/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 11:47
 *
 */

import 'package:dartz/dartz.dart';
import 'package:rotashiftcleanarch/core/domain/failures.dart';
import 'package:rotashiftcleanarch/core/domain/value_object.dart';
import 'package:rotashiftcleanarch/domain/value_objects/validators.dart';

class Rota extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  const Rota._(this.value);

  factory Rota(int input) {
    //assert(input != null, "Rota Value must be provided");
    return Rota._(validateRota(input));
  }

  factory Rota.fromString(String input) {
    //  assert(input != null, "Rota Value must be provided");
    return Rota._(validateRota(int.parse(input)));
  }
}

class Year extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  const Year._(this.value);

  factory Year(int input) {
    assert(input != null, "Year Value must be provided");
    return Year._(validateYear(input));
  }

  //TODO: check if  factory below is a good design

  factory Year.fromString(String input) {
    assert(input != null, "Year Value must be provided");
    return Year._(validateYear(int.parse(input)));
  }
}

class DayNumber extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  const DayNumber._(this.value);

  factory DayNumber(int input) {
    assert(input != null);
    return DayNumber._(validateDayNumber(input));
  }
}
