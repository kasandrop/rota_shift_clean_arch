/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 11:47
 *
 */

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:rotashiftcleanarch/core/util/simple_log_printer.dart';

@immutable
abstract class DayOffInsertionState extends Equatable {
  const DayOffInsertionState();
}

class InitialDayOffInsertionState extends DayOffInsertionState {
  final logger = getLogger('InitialDayOffInsertionState');

  InitialDayOffInsertionState() {
    logger.d('InitialDayOffInsertionState()');
  }

  @override
  List<Object> get props => [];
}

class InsertingState extends DayOffInsertionState {
  final logger = getLogger('InsertingState');

  InsertingState() {
    logger.d('InsertingState()');
  }

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ErrorState extends DayOffInsertionState {
  final String message;

  final logger = getLogger('ErrorState');

  ErrorState({@required this.message}) {
    logger.d('ErrorState()');
  }

  @override
  // TODO: implement props
  List<Object> get props => [message];
}

class ResponseOfInsertion extends DayOffInsertionState {
  final String data;
  final logger = getLogger('ResponseOfInsertion');

  ResponseOfInsertion({this.data}) {
    logger.d('ResponseOfInsertion()');
  }

  @override
  // TODO: implement props
  List<Object> get props => [data];
}
