//if any problem with the server .It means  response.status code!=200
import 'package:flutter/material.dart';
import 'package:rotashiftcleanarch/core/util/simple_log_printer.dart';

class ServerException implements Exception {
  final log = getLogger('ServerException ');

  ServerException() {
    log.wtf('ServerException()');
  }
}

class InsertException implements Exception {
  final String message;
  final log = getLogger('InsertException');

  InsertException({@required this.message}) {
    log.wtf('InsertException()');
  }
}

//if there is no data returned
class NoDataServerException implements Exception {
  final log = getLogger('NoDataServerException');

  NoDataServerException() {
    log.wtf('NoDataServerException()');
  }
}

//if no local data present days off
class CacheException implements Exception {
  final log = getLogger('CacheException');

  CacheException() {
    log.wtf('CacheException()');
  }
}

//if no local data present rotaYear
class NoDataCacheException implements Exception {
  final log = getLogger('NoDataCacheException');

  CacheException() {
    log.wtf('NoDataCacheException()');
  }
}
