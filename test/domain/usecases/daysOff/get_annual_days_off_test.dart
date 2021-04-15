/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 11:47
 *
 */

//
//class GetAnnualDaysOff extends UseCase<Map<DateTime, List<DayOff>>, RotaYear> {
//  final logger = getLogger('GetAnnualDaysOff usecase');
//  final AnnualDaysOffRepository repositoryAnnualDaysOff;
//  final RotaYearRepository repositoryRotaYear;
//
//  GetAnnualDaysOff({
//    this.repositoryAnnualDaysOff,
//    this.repositoryRotaYear,
//  }) {
//    logger.d('new  GetAnnualDaysOff()');
//  }
//
//  @override
//  Future<Either<Failure, Map<DateTime, List<DayOff>>>> call(
//    RotaYear rotaYear,
//  ) async {
//    logger.d('GetAnnualDaysOff usecase called with'
//        '\n rotaYear: $rotaYear');
//    //logger.d('new rota=$rota and new year=$year');
//    await repositoryRotaYear.saveRotaYear(
//      rotaYear: rotaYear,
//    );
//    return repositoryAnnualDaysOff.getAnnualDaysOff(
//      rotaYear: rotaYear,
//    );
//  }
//}

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rotashiftcleanarch/domain/repositories/annual_days_off_repository.dart';
import 'package:rotashiftcleanarch/domain/repositories/rota_year_repository.dart';
import 'package:rotashiftcleanarch/domain/usecases/daysOff/get_annual_days_off.dart';

class MockAnnualDaysOffRepository extends Mock implements AnnualDaysOffRepository {}

class MockRotaYearRepository extends Mock implements RotaYearRepository {}

void main() {
  GetAnnualDaysOff getAnnualDaysOff;
  MockAnnualDaysOffRepository mockAnnualDaysOffRepository;
  MockRotaYearRepository mockRotaYearRepository;
  setUp(() {
    mockRotaYearRepository = MockRotaYearRepository();
    mockAnnualDaysOffRepository = MockAnnualDaysOffRepository();
    getAnnualDaysOff = GetAnnualDaysOff(
      repositoryAnnualDaysOff: mockAnnualDaysOffRepository,
      repositoryRotaYear: mockRotaYearRepository,
    );
  });

  group('get_annual_days_off_use_case', () {
    test('returns a random double number in range', () {
      expect(
        r.nextInRange(1.9, 8.6),
        allOf(
          greaterThanOrEqualTo(1.9),
          lessThanOrEqualTo(8.6),
        ),
      );
    });
    test('returns a random int number in range', () {
      expect(
        r.nextInRange(1, 3),
        allOf(
          greaterThanOrEqualTo(1),
          lessThanOrEqualTo(3),
        ),
      );
    });
  });
}
