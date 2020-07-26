/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 11:47
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rotashiftcleanarch/configuration/injection_container.dart';
import 'package:rotashiftcleanarch/core/constants.dart';
import 'package:rotashiftcleanarch/core/theme.dart';
import 'package:rotashiftcleanarch/core/util/route_generator.dart';
import 'package:rotashiftcleanarch/core/util/simple_log_printer.dart';
import 'package:rotashiftcleanarch/presentation/calendar/calendar_bloc.dart';
import 'package:rotashiftcleanarch/presentation/holidays/holidays_bloc.dart';

class SplashPage extends StatelessWidget {
  SplashPage() {
    getLogger('SplashPage').d('SplashPage');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: sl.allReady(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          print('Creeate widget ');
          return getWidgetMultiBloc();
        } else {
          print('waiting for the futurebuilder to finish init');
          return Container(
            color: Colors.white,
            child: Image(
              image: AssetImage('images/splash_icon.png'),
            ),
          );

//            return CircularProgressIndicator(
//              backgroundColor: Colors.deepPurple,
//            );
        }
      },
    );
  }

  Widget getWidgetMultiBloc() {
    getLogger('SplashPage').d('getWidgetMultiBloc');
    return MultiBlocProvider(
      providers: [
        BlocProvider<CalendarBloc>(
            create: (BuildContext context) => sl<CalendarBloc>()
            //TODO:IMPORTANT because order is important change to one event

            ),
        BlocProvider<HolidaysBloc>(
          create: (BuildContext context) => sl<HolidaysBloc>(),
        ),
//
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (BuildContext context, Widget child) {
          return FlutterEasyLoading(
            child: child,
          );
        },
        title: 'Calendar Rota',
        theme: myLightTheme(),
        initialRoute: Routes.HOME,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
