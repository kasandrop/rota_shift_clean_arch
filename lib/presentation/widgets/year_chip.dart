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
import 'package:rotashiftcleanarch/presentation/calendar/calendar_bloc.dart';
import 'package:rotashiftcleanarch/presentation/calendar/calendar_event.dart';

import 'choice_chip_widget.dart';

class YearChip extends StatelessWidget {
  final String currentYearLookup;
  final int firstChipLabel;

  final int lastYears = 3;

  const YearChip({
    this.currentYearLookup,
    this.firstChipLabel,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChipWidget(
      chipsNumber: lastYears,
      textForLabelWidget: (int index) {
        return Text("${firstChipLabel - index}-${firstChipLabel - index + 1} ");
      },
      selectedLogic: (index) {
        return currentYearLookup == (firstChipLabel - index).toString();
      },
      dispatcher: (BuildContext context, int index) {
        EasyLoading.show(status: "Loading...");
        BlocProvider.of<CalendarBloc>(context)
            .add(CalendarEvent.rotaYearChanged(
          rota: 0.toString(),
          year: "${firstChipLabel - index}",
        ));
      },
    );
//    return Container(
//      child: SingleChildScrollView(
//        child: Row(
//          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//          children: List<Widget>.generate(lastYears, (int index) {
//            return ChoiceChip(
//              shape: BeveledRectangleBorder(),
//              label: Text((yearCalendar - index).toString() +
//                  "-" +
//                  (yearCalendar - index + 1).toString()),
//              padding: EdgeInsets.all(6),
//              labelStyle: TextStyle(
//                  color: Colors.black,
//                  fontSize: 14.0,
//                  fontWeight: FontWeight.normal),
//              backgroundColor: Color(0xffededed),
//              selectedColor: Color(0xffffc107),
//              selected: initialValueYear == (yearCalendar - index).toString(),
//              onSelected: (selected) {
//                //this selected is different than   selected above. this is callback informing if the value was changed
//                if (!selected) {
//                  return;
//                }
//                if (!this.isEnabled) {
//                  return;
//                }
//                log.d("chip was clicked:$selected");
//                dispatchForYear(
//                  year: (yearCalendar - index).toString(),
//                  context: context,
//                );
//
//              },
//            );
//          }).toList(),
//        ),
//      ),
//    );
  }
//
//  void dispatchForYear(
//      {@required String year, @required BuildContext context}) {
//    BlocProvider.of<CalendarBloc>(context).add(CalendarEvent.rotaYearChanged(
//      year: year,
//      rota: 0.toString(),
//    ));
//    //EasyLoading.show(status: 'loading');
//  }
}
