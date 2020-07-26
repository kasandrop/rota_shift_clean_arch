/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 11:47
 *
 */
//
//import 'package:flutter/material.dart';
//import 'package:flutter_easyloading/flutter_easyloading.dart';
//import 'package:rotashiftcleanarch/core/util/route_generator.dart';
//import 'package:rotashiftcleanarch/core/util/simple_log_printer.dart';
//
//class MyApp extends StatelessWidget {
//  MyApp() {
//    getLogger('MyApp()').d('MyApp');
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return FlutterEasyLoading(
//      child: MaterialApp(
//        title: 'Calendar Rota',
//        theme: ThemeData(
//          primarySwatch: Colors.blue,
//        ),
//        // initialRoute: Routes.SPLASH,
//        onGenerateRoute: RouteGenerator.generateRoute,
//      ),
//    );
//  }
//}
//

/*

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rotashiftcleanarch/configuration/injection_container.dart';
import 'package:rotashiftcleanarch/core/constants.dart';
import 'package:rotashiftcleanarch/core/util/route_generator.dart';
import 'package:rotashiftcleanarch/features/days_off/presentation/calendar/calendar_bloc.dart';
import 'package:rotashiftcleanarch/features/days_off/presentation/calendar/calendar_event.dart';
import 'package:rotashiftcleanarch/features/days_off/presentation/holidays/holidays_bloc.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: sl.allReady(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<CalendarBloc>(
                create: (BuildContext context) => sl.get<CalendarBloc>()
                  ..add(
                    CalendarEvent.defaultRotaYear(),
                  )
                  ..add(
                    CalendarEvent.defaultDaysOff(),
                  ),
              ),
              BlocProvider<HolidaysBloc>(
                  create: (BuildContext context) => sl.get<HolidaysBloc>()),
//              BlocProvider<DayOffInsertionBloc>(
//                create: (BuildContext context) => sl<DayOffInsertionBloc>(),
              //             ),
            ],
            child: MaterialApp(
              title: 'Calendar Rota',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              // home: CalendarPage(title: 'Table Calendar Demo'),
              initialRoute: Routes.HOME,
              onGenerateRoute: RouteGenerator.generateRoute,
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

 */
