/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 11:47
 *
 */

// Example holidays

/*Architecture

event is clicked  : rota changed or year is changed
  so that causes that Event is dispatched. In my example can be EventInforming
  about changing rota and separate event  inform about changing year.
  Now in block we have /conversters etc... but the most important thing is to call a use case
  from a block. We call it from map. this map will yield a stream that stream has a dependency.  We get this dependency from
  the result of use case call.

*/

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:logger/logger.dart';
import 'package:rotashiftcleanarch/presentation/pages/splash_page.dart';

import 'configuration/injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Logger.level = Level.verbose;

  di.init();

  runApp(SplashPage());
  config_easyLoading();
  WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
    //EasyLoading.show(status: 'loading...');
  });

  //TestPage testPage = TestPage();
}

void config_easyLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.black.withOpacity(0.77)
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..maskType = EasyLoadingMaskType.custom
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = false;
}
