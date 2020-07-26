/*
 * *
 *  * Created by Marcin Wasilewski on 24/07/20 18:06
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 24/07/20 16:36
 *
 */
//TODO: TMPORTANT!!!! instead of static methods use top level functions

class Helper {
  //working year starts on 1st April and finishes on 31 March next year
  //TODO: test this function
  static int getLookUpYearFromTodayConfiguration() {
    var today = DateTime.now().toUtc();
    var year = today.year;
    var startingNewWorkingYear = DateTime.utc(year, DateTime.march, 31);
    if (today.isAfter(startingNewWorkingYear)) {
      return year;
    } else {
      return year - 1;
    }
  }

  //TODO: test this function
  static int getLookUpYearFromDate(DateTime dateTimeGiven) {
    var year = dateTimeGiven.toUtc().year;
    var startingNewWorkingYear = DateTime.utc(year, DateTime.march, 31);
    if (dateTimeGiven.isAfter(startingNewWorkingYear)) {
      return year;
    } else {
      return year - 1;
    }
  }

  static DateTime getDateTimeFromDayNumber(int dayNumber, int year) {
    return DateTime(year, 1, 1).toUtc().add(Duration(days: dayNumber - 1));
  }

  static int getLookUpYearFromDayNumber(int dayNumber, int year) {
    DateTime dt =
        DateTime(year, 1, 1).toUtc().add(Duration(days: dayNumber - 1));
    return Helper.getLookUpYearFromDate(dt);
  }
}

int getLookUpYearFromTodayConfiguration2() {
  var today = DateTime.now().toUtc();
  var year = today.year;
  var startingNewWorkingYear = DateTime.utc(year, DateTime.march, 31);
  if (today.isAfter(startingNewWorkingYear)) {
    return year;
  } else {
    return year - 1;
  }
}
