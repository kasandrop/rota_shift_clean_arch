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
import 'package:rotashiftcleanarch/core/util/simple_log_printer.dart';
import 'package:rotashiftcleanarch/presentation/calendar/calendar_bloc.dart';
import 'package:rotashiftcleanarch/presentation/calendar/calendar_state.dart';

import 'calendar_scaffold.dart';

class CalendarPage extends StatelessWidget {
  CalendarPage() {
    getLogger('ApplicationPage()').d('ApplicationPage');
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CalendarBloc, CalendarState>(
      listenWhen: (p, c) => c.isSubmitting == false,
      // p.failureOrSuccessOption != c.failureOrSuccessOption,
      listener: (context, state) {
        EasyLoading.dismiss();
//        state.failureOrSuccessOption.fold(
//          () => {},
//          (either) {
//            either.fold(
//              (failure) {
//                FlushbarHelper.createError(
//                  duration: const Duration(seconds: 5),
//                  message:
//                      ('Unexpected error occurred, please contact support.'),
//                ).show(context);
//              },
//              (r) => {},
//            );
//          },
//        );
      },
      builder: (context, state) {
        return CalendarScaffold();
        ;
      },
    );
  }
}
