/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 11:47
 *
 */

import 'package:flutter/material.dart';
import 'package:rotashiftcleanarch/domain/entities/holiday.dart';
import 'package:table_calendar/table_calendar.dart';

Widget buildEventsMarker({
  DateTime date,
  List<Holiday> events,
  CalendarController controller,
  BuildContext context,
}) {
  //Map<DateTime, List<Holiday>>
  int hours = events.first.hours;
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color:
            _isDayInsideFocusedMonth(dateToCheck: date, controller: controller)
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.primaryVariant),
    width: 20.0,
    height: 20.0,
    child: Center(
      child: Text(
        '${hours.toString()}h',
        style: TextStyle().copyWith(
          color: Colors.white,
          fontSize: 12.0,
        ),
      ),
    ),
  );
}

bool _isDayInsideFocusedMonth({
  DateTime dateToCheck,
  CalendarController controller,
}) {
  int focusMonth = controller.focusedDay.month;
  int monthToCheck = dateToCheck.month;
  if (monthToCheck == focusMonth) return true;

  return false;
}

buildHolidaysMarker({
  DateTime date,
  BuildContext context,
  CalendarController controller,
}) {
  TextStyle _getTextStyle() {
    return Theme.of(context).textTheme.bodyText2.copyWith(
        color:
            _isDayInsideFocusedMonth(dateToCheck: date, controller: controller)
                ? date.weekday == DateTime.sunday
                    ? Theme.of(context).errorColor
                    : Theme.of(context).colorScheme.onSurface
                : date.weekday == DateTime.sunday
                    ? Theme.of(context).errorColor
                    : Theme.of(context).colorScheme.secondary);
  }

  BoxDecoration getBoxDecoration() {
    return BoxDecoration(
      shape: BoxShape.circle,
      color: _isDayInsideFocusedMonth(dateToCheck: date, controller: controller)
          ? Theme.of(context).colorScheme.surface
          : Theme.of(context).colorScheme.background,
      border: Border.all(
          color: _isDayInsideFocusedMonth(
                  dateToCheck: date, controller: controller)
              ? Theme.of(context).colorScheme.primaryVariant
              : Theme.of(context).colorScheme.secondary),
    );
  }

  return AnimatedContainer(
    duration: const Duration(milliseconds: 250),
    decoration: getBoxDecoration(),
    margin: const EdgeInsets.all(6.0),
    alignment: Alignment.center,
    child: Text('${date.day}', style: _getTextStyle()),
  );
}
