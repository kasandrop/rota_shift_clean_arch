/*
 * *
 *  * Created by Marcin Wasilewski on 24/07/20 16:41
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 24/07/20 16:36
 *
 */

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

HeaderStyle getHeaderStyle({BuildContext context}) {
  return HeaderStyle(
    formatButtonDecoration: BoxDecoration(
      border: Border.all(
        color: Theme.of(context).colorScheme.onSurface,
      ),
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
    ),

    // borderRadius:  BorderRadius.all(Radius.circular(12.0),),

    centerHeaderTitle: true,
    formatButtonVisible: true,
    formatButtonTextStyle: Theme.of(context).textTheme.button,
    titleTextStyle: Theme.of(context).textTheme.bodyText2,
    rightChevronIcon: Icon(Icons.chevron_right),
    leftChevronIcon: Icon(
      Icons.chevron_left,
    ),
  );
}
