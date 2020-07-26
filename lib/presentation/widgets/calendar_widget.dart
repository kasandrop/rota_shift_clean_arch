/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 11:47
 *
 */

// Example holidays
//final Map<DateTime, List> _holidays = {
//  DateTime(2019, 10, 24): ['rota'],
//  DateTime(2019, 10, 22): ['rota'],
//};

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';
import 'package:rotashiftcleanarch/core/calendar_builders.dart';
import 'package:rotashiftcleanarch/core/calendar_header_style.dart';
import 'package:rotashiftcleanarch/core/calendar_style.dart';
import 'package:rotashiftcleanarch/core/util/simple_log_printer.dart';
import 'package:rotashiftcleanarch/domain/entities/day_off.dart';
import 'package:rotashiftcleanarch/domain/entities/holiday.dart';
import 'package:rotashiftcleanarch/domain/helpers/default_year.dart';
import 'package:rotashiftcleanarch/domain/usecases/Params/param.dart';
import 'package:rotashiftcleanarch/domain/value_objects/input_to_entities.dart';
import 'package:rotashiftcleanarch/domain/value_objects/rota_year.dart';
import 'package:rotashiftcleanarch/presentation/DayOffInsertion/day_off_insertion_bloc.dart';
import 'package:rotashiftcleanarch/presentation/DayOffInsertion/day_off_insertion_event.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  final logger = getLogger('CalendarWidget');
  final String title;
  final Map<DateTime, List<DayOff>> daysOff;
  final Map<DateTime, List<Holiday>> holidays;
  final int year;
  final int rota;
  final OnDaySelected onDayLongPressed;

  //final HeaderStyle myHeaderStyle;

  // final Function(DateTime dateTime, List<dynamic> events) onCalendarDayClick;

  //final Function<DateTime,List<dynamic>>

  CalendarWidget({
    Key key,
    @required this.title,
    this.year = 0,
    this.rota = 0,
    this.daysOff = const {},
    this.holidays = const {},
    //onDayLongPressed isa callback.Yhe function is called only when onDayLongPressed is not null
    @required this.onDayLongPressed,
    // @required this.onCalendarDayClick,
  }) : super(key: key) {
    logger.d('CalendarWidget()');
  }

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  CalendarController _calendarController;

  afterLayoutWidgetBuild(context) {
    //EasyLoading.dismiss(animation: false);
  }

  @override
  void initState() {
    super.initState();

    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

//  void _onVisibleDaysChanged(
//      DateTime first, DateTime last, CalendarFormat format) {
//    print('CALLBACK: _onVisibleDaysChanged');
//  }

  @override
  Widget build(BuildContext context) {
    return _buildTableCalendarWithBuilders();
  }

  // More advanced TableCalendar configuration (using Builders & Styles)
  Widget _buildTableCalendarWithBuilders() {
    return TableCalendar(
      //  locale: 'en_GB',
      // onDaySelected: onCalendarDayClick,
      onDayLongPressed: (day, events) {
        var year = widget.year;
        if (day.isAfter(
          DateTime(year, DateTime.april, 1).toUtc(),
        )) {
          if (day.isBefore(DateTime(year + 1, DateTime.march, 31).toUtc())) {
            widget.onDayLongPressed(day, events);
          }
        }
      },
      calendarController: _calendarController,
      events: widget.holidays,
      holidays: widget.daysOff,
      initialCalendarFormat: CalendarFormat.month,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.monday,
      availableGestures: AvailableGestures.all,
      dayHitTestBehavior: HitTestBehavior.translucent,
      weekendDays: const [DateTime.sunday],
      //   availableCalendarFormats: const {CalendarFormat.month: ''},

//      calendarStyle: CalendarStyle(
//        outsideDaysVisible: true,
//        renderSelectedFirst: false,
//
//        outsideWeekendStyle: TextStyle(color: const Color(0xFF9E9E9E)),
//        // Material grey[500]
//        weekendStyle: TextStyle().copyWith(color: Colors.blue[800]),

//      ),
      calendarStyle: getCalendarStyle(context: context),
      //heading display
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: Theme.of(context).textTheme.bodyText2,
        weekendStyle: Theme.of(context).textTheme.bodyText2,
      ),

      headerStyle: getHeaderStyle(context: context),
      builders: CalendarBuilders(
        markersBuilder: (context, date, events, holidays) {
          final children = <Widget>[];
          if (holidays.isNotEmpty) {
            children.add(
              (buildHolidaysMarker(
                date: date,
                context: context,
                controller: _calendarController,
              )),
            );
          }

          if (events.isNotEmpty) {
            children.add(
              Positioned(
                right: 1,
                bottom: 1,
                child: buildEventsMarker(
                  date: date,
                  events: events,
                  controller: _calendarController,
                  context: context,
                ),
              ),
            );
          }

          return children;
        },
      ),
//
//
//        ),
//      builders: CalendarBuilders(
//        dayBuilder: _customDayBuilder,
//        selectedDayBuilder: _customDayBuilder,
//        todayDayBuilder: (context, date, _) {
//          return Container(
//            decoration: BoxDecoration(
//              shape: BoxShape.circle,
//              color: Colors.amber[400],
//            ),
//            margin: const EdgeInsets.all(4.0),
//            // padding: const EdgeInsets.only(top: 5.0, left: 6.0),
//
//            child: Center(
//              child: Text(
//                '${date.day}',
//                style: TextStyle().copyWith(fontSize: 16.0),
//              ),
//            ),
//          );
//        },
//        markersBuilder: (context, date, events, holidays) {
//          final children = <Widget>[];
//          if (holidays.isNotEmpty) {
//            children.add((_buildHolidaysMarker(date)));
//          }
//
//          if (events.isNotEmpty) {
//            children.add(
//              Positioned(
//                right: 1,
//                bottom: 1,
//                child: _buildEventsMarker(date, events),
//              ),
//            );
//          }
//
//          return children;
//        },
//      ),
      // builders: const CalendarBuilders(),
    );
  }

  Widget _customDayBuilder(context, date, _) {
    return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        margin: const EdgeInsets.all(4.0),
        // padding: const EdgeInsets.only(top: 5.0, left: 6.0),
        // color: Colors.deepOrange[300],

        child: Column(
          children: [
            Center(
              child: InkResponse(
                containedInkWell: false,
                highlightColor: Colors.deepPurple,
                splashColor: Colors.deepPurpleAccent,
                radius: 55,
                borderRadius: BorderRadius.circular(100),
                onTap: () {},
                child: Center(
                  child: Text(
                    '${date.day}',
                    //style: TextStyle().copyWith(fontSize: 16.0),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

//  Widget _buildHolidaysMarker(DateTime date) {
//    return Container(
//      constraints: BoxConstraints(
//        minWidth: 40.0,
//        maxWidth: 100.0,
//        minHeight: 40.0,
//        maxHeight: 100.0,
//      ),
//      margin: const EdgeInsets.all(4.0),
//      // padding: const EdgeInsets.only(top: 5.0, left: 6.0),
//      decoration: BoxDecoration(
//        shape: BoxShape.circle,
//        color: Colors.lightGreenAccent,
//      ),
//
//      child: Center(
//        child: Text(
//          '${date.day}',
//          // style: TextStyle().copyWith(fontSize: 16.0),
//        ),
//      ),
//    );
////    return Icon(
////      Icons.add_box,
////      size: 20.0,
////      color: Colors.blueGrey[800],
////    );
//  }

  void onCalendarDayClick(DateTime day, List events) {}

  onCalendarDayClick2(DateTime dateTime, List<dynamic> events) {
    getLogger('_CalendarWidgetState').d('onCalendarDayClick2');
    DateTime dt = DateTime.utc(dateTime.year, dateTime.month, dateTime.day);
    int doy = Jiffy(dt).dayOfYear;
    widget.logger.d("insert at year: ${dt.year} \n and month:${dt.month}  "
        "and day:${dt.day} \n and  at rota: ${widget.rota} and dayOfYear=$doy");
    BlocProvider.of<DayOffInsertionBloc>(context).add(
      DayOffEvent(
          insertParam: InsertParam(
              rotaYear: RotaYear(
                rota: widget.rota,
                year: Helper.getLookUpYearFromDate(dt),
              ),
              dateTimeYear: dt.year,
              dateTimeDoY: DayNumber(doy))),
    );
  }

//
//  Widget _buildButtons() {
//    return Column(
//      children: <Widget>[
//        Row(
//          mainAxisSize: MainAxisSize.max,
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          children: <Widget>[
//            RaisedButton(
//              child: Text('month'),
//              onPressed: () {
//                setState(() {
//                  _calendarController.setCalendarFormat(CalendarFormat.month);
//                });
//              },
//            ),
//            RaisedButton(
//              child: Text('2 weeks'),
//              onPressed: () {
//                setState(() {
//                  _calendarController
//                      .setCalendarFormat(CalendarFormat.twoWeeks);
//                });
//              },
//            ),
//            RaisedButton(
//              child: Text('week'),
//              onPressed: () {
//                setState(() {
//                  _calendarController.setCalendarFormat(CalendarFormat.week);
//                });
//              },
//            ),
//          ],
//        ),
//        const SizedBox(height: 8.0),
//        RaisedButton(
//          child: Text('setDay 10-07-2019'),
//          onPressed: () {
//            _calendarController.setSelectedDay(DateTime(2019, 7, 10),
//                runCallback: true);
//          },
//        ),
//      ],
//    );
//  }
  _checkIfDayIsInsideRotaYear(DateTime day, List events) {
    return widget.onDayLongPressed;
  }
}

/// this code was copied from page and moved here
///
/*
class _CalendarRotaPageState extends State<CalendarRotaPage>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  CalendarController _calendarController;

  final _bloc = CalendarRotaBloc();

  @override
  void initState() {
    super.initState();

    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void _updateValueOfRotas(int saveRotaNumber) {
    _bloc.sinkEventRotaNumber.add(new SaveRotaNumber(saveRotaNumber));
  }

  void _updateValueCalendarYear(int saveCalendarYear) {
    _bloc.sinkEventCalendarYear.add(new CalendarYearEvent(saveCalendarYear));
    DaysOffRemoteApiProvider te = DaysOffRemoteApiProvider();
    te.getAnnualDaysOff(rota: rota, year: year);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: Center(
        child: Material(
          color: Colors.white,
          elevation: 14.0,
          shadowColor: Color(0x802196F3),
          child: Column(
            children: <Widget>[],
          ),
        ),
      ),
    );
  }

  TableCalendar getTableCalendar() {
    return TableCalendar(
      locale: 'en_GB',
      calendarController: _calendarController,
      events: {},
      holidays: _holidays,
      initialCalendarFormat: CalendarFormat.month,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.monday,
      availableGestures: AvailableGestures.all,
      availableCalendarFormats: const {CalendarFormat.month: ''},
      calendarStyle: CalendarStyle(
        outsideDaysVisible: true,
        renderSelectedFirst: false,

        outsideWeekendStyle: TextStyle(color: const Color(0xFF9E9E9E)),
        // Material grey[500]
        weekendStyle: TextStyle().copyWith(color: Colors.blue[800]),
        holidayStyle: TextStyle().copyWith(color: Colors.blue[800]),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle().copyWith(color: Colors.blue[600]),
      ),
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        formatButtonVisible: false,
//          titleTextStyle: TextStyle().copyWith(
//            color: Colors.blue,
//            fontSize: 15,
        //  )
      ),
      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, _) {
          return Container(
              margin: const EdgeInsets.all(4.0),
              // padding: const EdgeInsets.only(top: 5.0, left: 6.0),
              // color: Colors.deepOrange[300],
              width: 100,
              height: 100,
              child: Center(
                child: Text(
                  '${date.day}',
                  //style: TextStyle().copyWith(fontSize: 16.0),
                ),
              ));
        },
        todayDayBuilder: (context, date, _) {
          return Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.amber[400],
            ),
            margin: const EdgeInsets.all(4.0),
            // padding: const EdgeInsets.only(top: 5.0, left: 6.0),

            width: 100,
            height: 100,
            child: Center(
              child: Text(
                '${date.day}',
                style: TextStyle().copyWith(fontSize: 16.0),
              ),
            ),
          );
        },
        markersBuilder: (context, date, events, holidays) {
          final children = <Widget>[];

          if (holidays.isNotEmpty) {
            children.add((_buildHolidaysMarker(date)));
          }

          return children;
        },
      ),
    );
  }
}

Widget _buildHolidaysMarker(DateTime date) {
  return Container(
    margin: const EdgeInsets.all(4.0),
    // padding: const EdgeInsets.only(top: 5.0, left: 6.0),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.lightGreenAccent,
    ),

    width: 100,
    height: 100,
    child: Center(
      child: Text(
        '${date.day}',
        // style: TextStyle().copyWith(fontSize: 16.0),
      ),
    ),
  );
//    return Icon(
//      Icons.add_box,
//      size: 20.0,
//      color: Colors.blueGrey[800],
//    );
}
*/
