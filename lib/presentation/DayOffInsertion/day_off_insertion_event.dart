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
import 'package:rotashiftcleanarch/domain/usecases/Params/param.dart';

@immutable
abstract class DayOffInsertionEvent extends Equatable {
  const DayOffInsertionEvent();
}

class DayOffEvent extends DayOffInsertionEvent {
  final InsertParam insertParam;
  final logger = getLogger('DayOffEvent');

  DayOffEvent({this.insertParam}) {
    logger.d('DayOffEvent()');
  }

  @override
  // TODO: implement props
  List<Object> get props => [insertParam];
}
