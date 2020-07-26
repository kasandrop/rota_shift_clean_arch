/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 11:47
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rotashiftcleanarch/presentation/DayOffInsertion/day_off_insertion_bloc.dart';
import 'package:rotashiftcleanarch/presentation/DayOffInsertion/day_off_insertion_state.dart';

import 'calendar_scaffold.dart';

class InsertionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New days Off Insertion'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        // CalendarPage() ,//or SplashPage,
        child: CalendarScaffold(),
      ),
    );
  }
}

class Insertion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        BlocListener<DayOffInsertionBloc, DayOffInsertionState>(
          condition: (previous, current) {
            if (current is ErrorState) {
              return true;
            }
            return false;
          },
          listener: (context, state) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text((state as ErrorState).message),
              ),
            );
          },
          child: Container(),
        ),
        BlocBuilder<DayOffInsertionBloc, DayOffInsertionState>(
          builder: (context, state) {
            if (state is ResponseOfInsertion) {
              return Container();
            } else {
              return Container();
            }
          },
        ),
        CalendarScaffold(),
      ],
    );
  }
}
