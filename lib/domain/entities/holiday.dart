/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 11:47
 *  
 */
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rotashiftcleanarch/domain/value_objects/input_to_entities.dart';

part 'holiday.freezed.dart';

@freezed
abstract class Holiday with _$Holiday {
  const factory Holiday({
    @required final int epochTimeStamp, //id
    @required final int hours,
    @required final Year chosenYear,
  }) = _Holiday;

//factory Holiday.initial() => Holiday();
}
