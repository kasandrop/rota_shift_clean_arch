//import 'package:rotashiftcleanarch/features/days_off/domain/entities/day_off.dart';
//
//import '../simple_log_printer.dart';
//import 'mapper_abstract.dart';
//
//class MapperToUi extends Mapper<Map<DateTime, List<String>>, List<DayOff>> {
//  final logger = getLogger('MapperToUi');
//
//  MapperToUi() {
//    logger.d('MapperToUi');
//  }
//
//  @override
//  Map<DateTime, List<String>> mapToView(List<DayOff> daysOff) {
//    logger.d(mapToView);
//    final Map<DateTime, List<String>> daysOffToReturn = {};
//    for (DayOff dayOff in daysOff) {
//      DateTime dateTimeZero = DateTime.utc(dayOff.year, DateTime.january, 1);
//      final dateTimeKey = dateTimeZero.add(
//        Duration(
//          days: (dayOff.dayNumber - 1),
//        ),
//      );
//      daysOffToReturn[dateTimeKey] = [dayOff.toString()];
//    }
//    return daysOffToReturn;
//  }
//}
