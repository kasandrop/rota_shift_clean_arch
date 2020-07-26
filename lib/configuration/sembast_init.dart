/*
 * *
 *  * Created by Marcin Wasilewski on 06/06/20 02:29
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 01/06/20 21:58
 *
 */

import 'dart:async';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rotashiftcleanarch/core/util/simple_log_printer.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

abstract class SembastInit {
  static Future<Database> init() async {
    getLogger('SembastInit').d('init');
    final docsPath = await getApplicationDocumentsDirectory();
    //TODO: exception might be thrown from create
    await docsPath.create(recursive: true);
    final dbPath = join(docsPath.path, 'rotaCalendar.db');
    final Database database = await databaseFactoryIo.openDatabase(dbPath);
    return database;
  }

  static Future<StoreRef> getStore() async {
    getLogger('SembastInit').d('getStore()-static');
    return await Future.value(intMapStoreFactory.store('holidays'));
    // return await intMapStoreFactory.store('holidays');
  }
}
