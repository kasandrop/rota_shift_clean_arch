/*
 * *
 *  * Created by Marcin Wasilewski on 23/05/20 02:01
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 21/05/20 11:27
 *
 */
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

abstract class SqfliteInit {
  static Future<Database> init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    //TODO: exception might be thrown from create
    await documentsDirectory.create(recursive: true);
    //TODO: test with a new database
    final path = join(documentsDirectory.path, "data1.db");
    final Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database newDb, int version) {
        newDb.execute("""
          CREATE TABLE RotaCalendar
            (
              id TEXT PRIMARY KEY,
              dayNumber INTEGER,
              year INTEGER,
              rota INTEGER,
              chosenYear INTEGER
            )
        """);
        newDb.execute("""
          CREATE TABLE Holidays
            (
              holiday_day INTEGER PRIMARY KEY,
              hours INTEGER,
              chosenYear INTEGER
            )
        """);
      },
    );
    return database;
  }
}
