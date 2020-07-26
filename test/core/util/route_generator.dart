/*
 * *
 *  * Created by Marcin Wasilewski on 24/07/20 18:06
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 24/07/20 18:02
 *
 */

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:rotashiftcleanarch/core/constants.dart';
import 'package:rotashiftcleanarch/core/error/failures.dart';
import 'package:rotashiftcleanarch/core/util/simple_log_printer.dart';
import 'package:rotashiftcleanarch/domain/entities/day_off.dart';
import 'package:rotashiftcleanarch/domain/entities/holiday.dart';

import 'package:rotashiftcleanarch/domain/value_objects/rota_year.dart';
import 'package:rotashiftcleanarch/presentation/pages/calendar_page.dart';
import 'package:rotashiftcleanarch/presentation/pages/holidays_page.dart';
import 'package:rotashiftcleanarch/presentation/pages/insertion_page.dart';

abstract class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.HOME:
        return MaterialPageRoute(builder: (_) => CalendarPage());
        break;
      case Routes.HOLIDAYS: //<--------------------------------
        HolidaysPageArguments holidaysArguments = args as HolidaysPageArguments;

        // Validation of correct data type
        // if (args is String)
        return MaterialPageRoute(builder: (BuildContext context) {
          return HolidaysPage();
        });
        break;
      case Routes.INSERTION:
        // Validation of correct data type
        // if (args is String)
        return MaterialPageRoute(
          builder: (_) => InsertionPage(
              // data: args,
              ),
        );
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        //return _errorRoute();
        break;
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

//**************************************************************************
// Arguments holder classes
//***************************************************************************

class HolidaysPageArguments {
  final RotaYear rotaYear;
  final Option<Either<Failure, Map<DateTime, List<DayOff>>>> daysOff;
  final Option<Either<Failure, Map<DateTime, List<Holiday>>>> holidays;

  HolidaysPageArguments({
    this.rotaYear,
    this.daysOff,
    this.holidays,
  }) {
    getLogger('+++++++++++++++++HolidaysPageArguments').d(
        'instantiation  toStringRoltaYear:${this.rotaYear.getRotaOrCrash()} +${this.rotaYear.getYearOrCrash()}');
  }
}
