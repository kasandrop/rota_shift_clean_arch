/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 12:02
 *
 */

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rotashiftcleanarch/domain/entities/holiday.dart';
import 'package:rotashiftcleanarch/domain/value_objects/input_to_entities.dart';

part 'holiday_dto.freezed.dart';

part 'holiday_dto.g.dart';

@freezed
abstract class HolidayDto with _$HolidayDto {
  const factory HolidayDto({
    @required int epochTimeStamp,
    @required int hours,
    @required int year,
  }) = _HolidayDto;

  factory HolidayDto.fromDomain(Holiday holiday) {
    return HolidayDto(
        hours: holiday.hours,
        year: holiday.chosenYear.getOrCrash(),
        epochTimeStamp: holiday.epochTimeStamp);
  }

  factory HolidayDto.fromJson(Map<String, dynamic> json) =>
      _$HolidayDtoFromJson(json);
}

extension HolidayDtoX on HolidayDto {
  Holiday toDomain() {
    return Holiday(
      epochTimeStamp: epochTimeStamp,
      hours: hours,
      chosenYear: Year(year),
    );
  }
}
