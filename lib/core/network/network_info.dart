import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:rotashiftcleanarch/core/util/simple_log_printer.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final log = getLogger(' NetworkInfoImpl');

  final DataConnectionChecker connectionChecker;

  NetworkInfoImpl({@required this.connectionChecker});

  @override
  Future<bool> get isConnected {
    log.d(' isConnected ');
    return connectionChecker.hasConnection;
  }
}
