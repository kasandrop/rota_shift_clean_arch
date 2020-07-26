/*
 * *
 *  * Created by Marcin Wasilewski on 24/07/20 16:33
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 20/07/20 09:38
 *
 */

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

CalendarStyle getCalendarStyle({BuildContext context}) {
  return CalendarStyle(
    //CalendarStyle _initCalendarStyle() {
//  return CalendarStyle(
    weekendStyle: Theme.of(context)
        .textTheme
        .bodyText2
        .copyWith(color: Theme.of(context).errorColor),
    todayStyle: Theme.of(context).textTheme.bodyText2,
    selectedStyle: Theme.of(context).textTheme.bodyText2,
    highlightToday: true,
    outsideStyle: Theme.of(context)
        .textTheme
        .bodyText2
        .copyWith(color: Theme.of(context).colorScheme.secondary),
    holidayStyle: Theme.of(context)
        .textTheme
        .bodyText2
        .copyWith(color: Theme.of(context).colorScheme.onSurface),
  );
//}
}
