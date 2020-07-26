/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 11:47
 *
 */

//================update the Parent widget from a child widget by using CallBacks.
//1. create a method in a parent widget
//2. pass the method as a callback from a Parent Widget to a Child widget
//3. create a Callback param in your child widget
//       final ValueChanged<String> parentAction;
//             or
//       +final void Function(String value) parentAction;
//4. Execute the callback from  your child widget

import 'package:flutter/material.dart';

class ChoiceChipWidget extends StatelessWidget {
  final int chipsNumber;
  final Text Function(int index) textForLabelWidget;
  final bool Function(int index) selectedLogic;
  final void Function(
    BuildContext context,
    int rota,
  ) dispatcher;

  ChoiceChipWidget({
    @required this.chipsNumber,
    @required this.textForLabelWidget,
    @required this.selectedLogic,
    @required this.dispatcher,
  });

  List<Widget> _buildChoiceList(BuildContext context) {
    //print('${Theme.of(context).chipTheme.toString()}');
    return List<Widget>.generate(chipsNumber, (int index) {
      return ChoiceChip(
        //   shape: BeveledRectangleBorder(),
        label: textForLabelWidget(index),
        // padding: EdgeInsets.all(10.0),
//        labelStyle: TextStyle(
//          color: Colors.black,
//          fontSize: 14.0,
//          fontWeight: FontWeight.normal,
//        ),
        // labelPadding: EdgeInsets.all(7.0),
        //backgroundColor: Theme.of(context).chipTheme.backgroundColor,
        //selectedColor: Theme.of(context).chipTheme.selectedColor,
        // selectedShadowColor: Theme.of(context).chipTheme.selectedShadowColor,
        //selectedColor: Color(0xffffc107),
        selected: selectedLogic(index),
        onSelected: (selected) {
          // Theme.of(context)
          //     .chipTheme
          //     .copyWith(labelStyle: TextStyle(color: Colors.white));
          //Theme.of(context).chipTheme.backgroundColor
          //this selected is different than   selected above. this is callback informing if the value was changed
          if (!selected) {
            //   .copyWith(labelStyle: TextStyle(color: Colors.black));
            return;
          }

          //log.d("chip was clicked:$selected");
          dispatcher(context, index);

          //EasyLoading.show(status: 'loading');
//                dispatchForYear(
//                    year: (yearCalendar - index).toString(),
//                    rota: initialValueRota,
//                    context: context);
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 5.0, bottom: 4.0),
      child: Wrap(
        direction: Axis.horizontal,
        spacing: 8.0,
        alignment: WrapAlignment.spaceEvenly,
        //  crossAxisAlignment: WrapCrossAlignment.end,
        children: _buildChoiceList(context),
        //crossAxisAlignment: WrapCrossAlignment.center,
        // runAlignment: WrapAlignment.spaceEvenly,
      ),
    );
  }
}
/*
class ChoiceChipWidget extends StatefulWidget {
  final List<String> reportList;
  final ValueChanged<int> parentAction;
  final initialValue;

  ChoiceChipWidget(
      {Key key, this.reportList, this.parentAction, this.initialValue})
      : super(key: key);

  @override
  _ChoiceChipWidgetState createState() =>
      new _ChoiceChipWidgetState(selectedChoice: this.initialValue);
}

class _ChoiceChipWidgetState extends State<ChoiceChipWidget> {
  String selectedChoice = "";

  _ChoiceChipWidgetState({this.selectedChoice});

  List<Widget> _buildChoiceList() {
    List<Widget> choices = List();
    widget.reportList.forEach(
      (item) {
        choices.add(
          ChoiceChip(
            shape: BeveledRectangleBorder(),
            label: Text(item),
            padding: EdgeInsets.all(13),
            labelStyle: TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                fontWeight: FontWeight.normal),
            backgroundColor: Color(0xffededed),
            selectedColor: Color(0xffffc107),
            selected: selectedChoice == item,
            onSelected: (selected) {
              if (!selected) {
                return;
              }
              print("chip was clicked:$selected");
              widget.parentAction(int.parse(item));
              setState(() {
                selectedChoice = item;
              });
            },
          ),
        );
      },
    );
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _buildChoiceList(),
    );
  }
}
 */
