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
import 'package:rotashiftcleanarch/presentation/calendar/calendar_event.dart';

import 'choice_chip_widget.dart';

class RotaChip extends StatelessWidget {
  @required
  final String initialValueRota;

  const RotaChip({
    this.initialValueRota = '0',
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChipWidget(
      chipsNumber: 7,
      textForLabelWidget: (index) {
        return Text((index + 1).toString());
      },
      dispatcher: (BuildContext context, int index) {
        getLogger('ChoiceChipWidget dispatcher').d('build');
        EasyLoading.show(status: "Loading...");
        return BlocProvider.of<CalendarBloc>(context).add(
          CalendarEvent.rotaYearChanged(
            rota: (1 + index).toString(),
            year: 0.toString(),
          ),
        );
      },
      selectedLogic: (int index) {
        return initialValueRota == (index + 1).toString();
      },
    );
//    return Container(
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        children: List<Widget>.generate(
//          7,
//          (int index) {
//            valueNum = index + 1;
//            ChoiceChip choiceChip = ChoiceChip(
//                shape: BeveledRectangleBorder(),
//                label: Text((index + 1).toString()),
//                padding: EdgeInsets.all(6),
//                labelStyle: TextStyle(
//                    color: Colors.black,
//                    fontSize: 14.0,
//                    fontWeight: FontWeight.normal),
//                backgroundColor: Color(0xffededed),
//                selectedColor: Color(0xffffc107),
//                selected: initialValueRota == (valueNum).toString(),
//                onSelected: (selected) {
//                  if (!selected) {
//                    return;
//                  }
//                  if (!this.isEnabled) {
//                    return;
//                  }
//                  log.d("chip was clicked:$selected");
//                  dispatchForRota(
//                      rota: (index + 1).toString(),
//                      //year: initialValueYear,
//                      context: context);
//                }); //..onSelected=((_)=>false);
//
//            return choiceChip;
//          },
//        ).toList(),
//      ),
//    );
  }
}
