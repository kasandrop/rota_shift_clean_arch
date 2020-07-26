/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 11:47
 *
 */
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:rotashiftcleanarch/core/error/failures.dart';
import 'package:rotashiftcleanarch/core/util/simple_log_printer.dart';
import 'package:rotashiftcleanarch/domain/entities/day_off.dart';
import 'package:rotashiftcleanarch/domain/entities/holiday.dart';
import 'package:rotashiftcleanarch/presentation/holidays/bloc.dart';
import 'package:rotashiftcleanarch/presentation/holidays/holidays_bloc.dart';
import 'package:rotashiftcleanarch/presentation/widgets/calendar_widget.dart';
import 'package:rotashiftcleanarch/presentation/widgets/choice_chip_widget.dart';

const String INVALID_DATA_MESSAGE = 'Wrong input Data';

const String INSERT_DAY_OFF_EXISTS_FAILURE = 'Insert Day Off Already Exists';
const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String NO_INTERNET_FAILURE_MESSAGE = 'No Internet connection';
const String NO_DATA_SERVER_FAILURE_MESSAGE = 'No data provided yet';
const String NO_DATA_CACHE_FAILURE_MESSAGE =
    'Rota or Year was not saved last time '
    'or configuration didn\'t run properly';

class HolidaysPage extends StatelessWidget {
  // final RotaYear rotaYear;
  // final Option<Either<Failure, Map<DateTime, List<DayOff>>>> daysOffOption;
  // final Option<Either<Failure, Map<DateTime, List<Holiday>>>> holidaysOption;//<- this will go inside initial state or new  event start

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      case NoDataCacheFailure:
        return NO_DATA_CACHE_FAILURE_MESSAGE;
      case NoInternetFailure:
        return NO_INTERNET_FAILURE_MESSAGE;
      case NoDataServerFailure:
        return NO_DATA_SERVER_FAILURE_MESSAGE;
      case InvalidInputFailure:
        return INVALID_DATA_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }

  HolidaysPage() {
    getLogger('HolidaysPage').d('HolidaysPage');
  }

  @override
  Widget build(BuildContext context) {
    //int year = rotaYear.year.getOrCrash();
    return Scaffold(
      appBar: AppBar(title: BlocBuilder<HolidaysBloc, HolidaysState>(
        builder: (BuildContext context, state) {
          int year = state.year.isValid() ? state.year.getOrCrash() : null;

          return year != null
              ? Text('Holidays $year - ${year + 1}')
              : Container();
        },
      ), leading: BlocBuilder<HolidaysBloc, HolidaysState>(
        builder: (BuildContext context, state) {
          return new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, state.holidaysOption);
            },
          );
        },
      )),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        // CalendarPage() ,//or SplashPage,
        child: BlocConsumer<HolidaysBloc, HolidaysState>(
          listener: (BuildContext context, HolidaysState state) {
//          state.isSubmitting
//              ? EasyLoading.show(status: 'Loading...')
//              : EasyLoading.dismiss(animation: true);
            state.holidaysOption.fold(
              () => null,
              (either) {
                either.fold(
                    (failure) => Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Error'),
                          ),
                        ),
                    (success) => null);
              },
            );
          },
          builder: (context, state) {
            var daysOff = state.daysOffOption.fold(
                () => <DateTime, List<DayOff>>{},
                (a) => a.fold((l) => <DateTime, List<DayOff>>{}, (r) => r));

            final holidays = state.holidaysOption.fold(
                () => <DateTime, List<Holiday>>{},
                (a) => a.fold((l) => <DateTime, List<Holiday>>{}, (r) => r));

            final List<Holiday> hols =
                SplayTreeMap<DateTime, List<Holiday>>.from(
                        holidays,
                        (DateTime a, DateTime b) => b
                            .toUtc()
                            .millisecondsSinceEpoch
                            .compareTo(a.toUtc().millisecondsSinceEpoch))
                    .values
                    .map((List<Holiday> e) => e.first)
                    .toList();
            int sumOfHours = 0;
            return Column(
              children: <Widget>[
                CalendarWidget(
                    title: 'Title of the calendar',
                    daysOff: daysOff,
                    holidays: holidays,
                    year: state.year.getOrCrash(),
                    rota: state.rota.getOrCrash(),
                    onDayLongPressed:
                        (DateTime dateTime, List<dynamic> events) {
                      getLogger('HolidaysPage').d(
                        'onDayLongPressed',
                      );
                      int epochTime = dateTime.toUtc().millisecondsSinceEpoch;
                      BlocProvider.of<HolidaysBloc>(context).add(
                          HolidaysEvent.addDeleteHoliday(
                              holidayDay: epochTime));
                    }
                    //   onCalendarDayClick: myCalendarDayClick,
                    ),
                Expanded(
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemCount: hols.length,
                    itemBuilder: (context, index) {
                      sumOfHours += hols[index].hours;
                      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
                              hols[index].epochTimeStamp)
                          .toUtc();
                      return ListTile(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 0.0,
                          horizontal: 4.0,
                        ),
                        leading: Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Column(
                            children: [
                              Text(
                                '${DateFormat.MMMM().format(dateTime)}',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              Text(
                                '${dateTime.day}',
                                style: Theme.of(context).textTheme.headline6,
                              )
                            ],
                          ),
                        ),
                        title: Text('${hols[index].hours} h. of holidays',
                            style: Theme.of(context).textTheme.subtitle1),
                        subtitle: Text(
                          'lorem ipsum polerum',
                          style: Theme.of(context).textTheme.caption,
                        ),
                        trailing: Text(
                          '${sumOfHours} h',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        onTap: () async {
                          int h = await _hours(
                            context: context,
                            hour: hols[index].hours,
                          );
                          if (h == null) {
                            return;
                          }
                          BlocProvider.of<HolidaysBloc>(context).add(
                            HolidaysEvent.holidayHours(
                              hours: h,
                              epochTimeStamp: hols[index].epochTimeStamp,
                            ),
                          );
                        },
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                      thickness: 1.0,
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Future<int> _hours({
    BuildContext context,
    int hour,
  }) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Select assignment'),
          children: <Widget>[
            ChoiceChipWidget(
              chipsNumber: 8,
              textForLabelWidget: (int index) => Text("${index + 1}h"),
              selectedLogic: (int index) => hour == (index + 1) ? true : false,
              dispatcher: (BuildContext context, int i) =>
                  Navigator.pop(context, i + 1),
            ),
          ],
        );
      },
    );
  }
}
