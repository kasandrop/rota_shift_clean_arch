/*
 * *
 *  * Created by Marcin Wasilewski on 09/07/20 15:28
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 08/07/20 16:44
 *
 */

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:rotashiftcleanarch/core/util/simple_log_printer.dart';

@immutable
abstract class Failure extends Equatable {
  final log = getLogger('Failure');

  // If the subclasses have some properties, they'll get passed to this constructor
  // so that Equatable can perform value comparison.
  @override
  // TODO: implement props
  List<Object> get props => [];
}

// General failures

class ServerFailure extends Failure {
  ServerFailure() {
    log.wtf('ServerFailure()');
  }
}

class UnexpectedFailure extends Failure {
  UnexpectedFailure() {
    log.wtf('UnexpectedFailure()');
  }
}

class SembastFailure extends Failure {
  SembastFailure() {
    log.wtf('SembastFailure()');
  }
}

class InsertDayOffExistsFailure extends Failure {
  InsertDayOffExistsFailure() {
    log.wtf('InsertDayOffExistsFailure()');
  }
}

class InsertFailure extends Failure {
  final String message;

  InsertFailure({@required this.message}) {
    log.wtf('InsertFailure()');
  }
}

class CacheFailure extends Failure {
  CacheFailure() {
    log.wtf(' CacheFailure()');
  }
}

class InvalidInputFailure extends Failure {
  InvalidInputFailure() {
    log.wtf('InvalidInputFailure()');
  }
}

class NoInternetFailure extends Failure {
  NoInternetFailure() {
    log.wtf(' NoInternetFailure()');
  }
}

class NoDataServerFailure extends Failure {
  NoDataServerFailure() {
    log.wtf(' NoDataServerFailure()');
  }
}

//TODO: change it to CacheFailure
/// [ NoDataCacheFailure ]  is called when when first time is accessed
///   [RotaYear]. And in that case configuration saves default value
class NoDataCacheFailure extends Failure {
  NoDataCacheFailure() {
    log.wtf('  NoDataCacheFailure()');
  }
}
