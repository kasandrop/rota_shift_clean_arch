/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 11:47
 *
 */

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rotashiftcleanarch/core/error/failures.dart';
import 'package:rotashiftcleanarch/core/util/simple_log_printer.dart';
import 'package:rotashiftcleanarch/domain/usecases/daysOff/insert_new_day_off.dart';

import 'bloc.dart';

class DayOffInsertionBloc
    extends Bloc<DayOffInsertionEvent, DayOffInsertionState> {
  final InsertDayOffIntoCloud insertDayOffIntoCloud;
  final logger = getLogger('DayOffInsertionBloc');

  DayOffInsertionBloc({this.insertDayOffIntoCloud}) {
    logger.d('DayOffInsertionBloc()');
  }

  @override
  DayOffInsertionState get initialState {
    logger.d('get initialState');
    return InitialDayOffInsertionState();
  }

  @override
  void onTransition(
      Transition<DayOffInsertionEvent, DayOffInsertionState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    logger.wtf('Error inside mapEventToState ');
    logger.wtf(stacktrace?.toString());
    super.onError(error, stacktrace);
  }

  @override
  Stream<DayOffInsertionState> mapEventToState(
    DayOffInsertionEvent event,
  ) async* {
    logger.d('mapEventToState');
    if (event is DayOffEvent) {
      yield InsertingState();
      final Either<Failure, String> data =
          await insertDayOffIntoCloud(event.insertParam);
      yield* data.fold(
        (l) async* {
          yield ErrorState(message: (l as InsertFailure).message);
        },
        (r) async* {
          yield ResponseOfInsertion(data: r);
        },
      );
    }
  }
}
