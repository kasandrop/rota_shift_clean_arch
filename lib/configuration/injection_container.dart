/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 11:47
 *
 */

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:rotashiftcleanarch/configuration/sembast_init.dart';
import 'package:rotashiftcleanarch/configuration/sqflite_init.dart';
import 'package:rotashiftcleanarch/core/network/network_info.dart';
import 'package:rotashiftcleanarch/core/util/FirebaseDecoder.dart';
import 'package:rotashiftcleanarch/core/util/simple_log_printer.dart';
import 'package:rotashiftcleanarch/domain/helpers/default_year.dart';
import 'package:rotashiftcleanarch/domain/repositories/annual_days_off_repository.dart';
import 'package:rotashiftcleanarch/domain/repositories/holidays_repository.dart';
import 'package:rotashiftcleanarch/domain/repositories/rota_year_repository.dart';
import 'package:rotashiftcleanarch/domain/usecases/daysOff/get_annual_days_off.dart';
import 'package:rotashiftcleanarch/domain/usecases/daysOff/get_create_rotayear_if_doesnot_exist.dart';
import 'package:rotashiftcleanarch/domain/usecases/daysOff/get_current_rota_year.dart';
import 'package:rotashiftcleanarch/domain/usecases/holidays/add_delete_holiday.dart';
import 'package:rotashiftcleanarch/domain/usecases/holidays/change_holidays_hours.dart';
import 'package:rotashiftcleanarch/domain/usecases/holidays/get_holidays.dart';
import 'package:rotashiftcleanarch/domain/value_objects/rota_year.dart';
import 'package:rotashiftcleanarch/domain/value_objects/rota_year_memorized.dart';
import 'package:rotashiftcleanarch/infrastructure/datasources/abstractions/annual_days_off_local_data_source.dart';
import 'package:rotashiftcleanarch/infrastructure/datasources/abstractions/annual_days_off_remote_data_source.dart';
import 'package:rotashiftcleanarch/infrastructure/datasources/abstractions/holidays_local_data_source.dart';
import 'package:rotashiftcleanarch/infrastructure/datasources/abstractions/rota_year_local_data_source.dart';
import 'package:rotashiftcleanarch/infrastructure/datasources/providers/days_off_local_db_provider.dart';
import 'package:rotashiftcleanarch/infrastructure/datasources/providers/days_off_remote_api_provider.dart';
import 'package:rotashiftcleanarch/infrastructure/datasources/providers/rota_year_local_data_source_provider.dart';
import 'package:rotashiftcleanarch/infrastructure/datasources/providers/sembast/holidays_local_sembast_provider.dart';
import 'package:rotashiftcleanarch/infrastructure/repositories/annual_days_off_repository_impl.dart';
import 'package:rotashiftcleanarch/infrastructure/repositories/holidays_repository_impl.dart';
import 'package:rotashiftcleanarch/infrastructure/repositories/rota_year_repository_Impl.dart';
import 'package:rotashiftcleanarch/presentation/calendar/CalendarInitialStateDataClass.dart';
import 'package:rotashiftcleanarch/presentation/calendar/calendar_bloc.dart';
import 'package:rotashiftcleanarch/presentation/calendar/calendar_initial_state_data.dart';
import 'package:rotashiftcleanarch/presentation/holidays/holidays_bloc.dart';
import 'package:sembast/sembast.dart' as Sembast;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

final GetIt sl = GetIt.instance;

//Types which depend on async Singletons we have to explicitly name.
//We do that by adding dependsOn: and types are put in the List [] Name
// singleton async function
void init() async {
  //async singletons
  sl.registerSingletonAsync<SharedPreferences>(
      () async => await SharedPreferences.getInstance());

  sl.registerSingletonAsync<Sembast.StoreRef>(
      () async => await SembastInit.getStore());
  //--
  //-------------------------------------------------------------------------
  // DataBase
  //-----------------------------------------------------------------------
  //--
  sl.registerSingletonAsync<Database>(() async => await SqfliteInit.init());
  sl.registerSingletonAsync<Sembast.Database>(
      () async => await SembastInit.init());
  //! External
  sl.registerSingleton<Client>(Client());
  sl.registerSingleton(() => DataConnectionChecker());
  sl.registerFactory<int>(() => Helper.getLookUpYearFromTodayConfiguration());

  sl.registerSingleton<DataConnectionChecker>((DataConnectionChecker()));
  sl.registerSingleton<NetworkInfo>(NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton(() => FirebaseDecoder());

  //  dataSourcesNetworkInfo
  sl.registerSingleton<AnnualDaysOffRemoteDataSource>(
    (DaysOffRemoteApiProvider(
      client: sl(),
      firebaseDecoder: sl(),
    )),
  );
  //--
  //-------------------------------------------------------------------------
  // Data Sources
  //-----------------------------------------------------------------------
  //--
  sl.registerSingletonWithDependencies<AnnualDaysOffLocalDataSource>(
    () => DaysOffLocalDbProvider(
      database: sl(),
    ),
    dependsOn: [Database],
  );

  sl.registerSingletonWithDependencies<RotaYearLocalDataSource>(
      () => RotaYearLocalDataSourceImpl(
            sharedPreferences: sl(),
          ),
      dependsOn: [SharedPreferences]);

  sl.registerSingletonWithDependencies<HolidaysLocalDataSource>(
      () => HolidaysLocalSembastProvider(
            store: sl(),
            database: sl(),
          ),
      dependsOn: [Sembast.StoreRef, Sembast.Database]);
  //--
  //-------------------------------------------------------------------------
  // Repository
  //-----------------------------------------------------------------------
  //--
  sl.registerSingletonWithDependencies<AnnualDaysOffRepository>(
      //y
      () => AnnualDaysOffRepositoryImpl(
            remoteDaysOffDataSource: sl(),
            localDaysOffDataSource: sl(),
            networkInfo: sl(),
          ),
      dependsOn: [
        AnnualDaysOffLocalDataSource,
      ]);

  sl.registerSingletonWithDependencies<HolidaysRepository>(
      () => HolidaysRepositoryImpl(
            holidaysLocalDataSource: sl(),
          ),
      dependsOn: [HolidaysLocalDataSource]);

  sl.registerSingletonWithDependencies<RotaYearRepository>(
      () => RotaYearRepositoryImpl(
            localDataSource: sl(),
          ),
      dependsOn: [RotaYearLocalDataSource]);
  //--
  //-------------------------------------------------------------------------
  // use cases
  //-----------------------------------------------------------------------
  //--
  //sl.registerLazySingleton(() => InsertDayOffIntoCloud(repository: sl()));
  sl.registerSingletonWithDependencies(
    () => ChangeHolidaysHours(
      holidaysRepository: sl(),
    ),
    dependsOn: [HolidaysRepository],
  );

  sl.registerSingletonWithDependencies(
    () => GetCurrentRotaYear(
      repository: sl(),
    ),
    dependsOn: [RotaYearRepository],
  );

  sl.registerSingletonWithDependencies(
    () => GetAnnualDaysOff(
      repositoryRotaYear: sl(),
      repositoryAnnualDaysOff: sl(),
    ),
    dependsOn: [AnnualDaysOffRepository, RotaYearRepository],
  );
  sl.registerSingletonWithDependencies<AddDeleteHoliday>(
    () => AddDeleteHoliday(
      holidaysRepository: sl(),
    ),
    dependsOn: [HolidaysRepository],
  );

  sl.registerSingletonWithDependencies<GetHolidays>(
    () => GetHolidays(
      holidaysRepository: sl(),
    ),
    dependsOn: [HolidaysRepository],
  );
  //the next registration is needed for the use case below
  sl.registerSingleton<RotaYear>(
    (RotaYear(
      rota: 7,
      year: sl(),
    )),
  );
  sl.registerSingletonWithDependencies(
    () => CreateRotaYearIfDoesNotExistUseCase(
      getCurrentRotaYear: sl(),
      repository: sl(),
      defaultRotaYear: sl(),
    ),
    dependsOn: [
      GetCurrentRotaYear,
      RotaYearRepository,
    ],
  );

  //here i await sl.await to get types instead of futures
//  map holds {'rota':$value1,'year':$value2}
//  final Map<String, int> map = await sl
//      .isReady<CreateRotaYearIfDoesNotExistUseCase>()
//      .then((_) => sl<CreateRotaYearIfDoesNotExistUseCase>()
//          .saveDefaultOrJustCreateRotaYear());
//
//  //daysoff
//  GetAnnualDaysOff getAnnualDaysOff = await sl.isReady<GetAnnualDaysOff>().then(
//        (_) => sl<GetAnnualDaysOff>(),
//      );
//  // sl.get<GetAnnualDaysOff>();
//  Either<Failure, Map<DateTime, List<DayOff>>> daysOff;
//  daysOff = await getAnnualDaysOff(
//    RotaYear(rota: map['rota'], year: map['year']),
//  );
//  Option<Either<Failure, Map<DateTime, List<DayOff>>>> daysOffOption =
//      optionOf(daysOff);
//
//  //holidays
//  GetHolidays getHolidays = await sl.isReady<GetHolidays>().then(
//        (_) => sl<GetHolidays>(),
//      );
//  // GetHolidays getHolidays = sl.get<GetHolidays>();
//  Either<Failure, Map<DateTime, List<Holiday>>> holidays;
//  holidays = await getHolidays(Year(map['year']));
//  Option<Either<Failure, Map<DateTime, List<Holiday>>>> holidaysOption =
//      optionOf(holidays);
//
//  sl.registerSingleton<CalendarInitialStateStartUp>(
//    CalendarInitialStateStartUp(
//      year: Year(map['year']),
//      rota: Rota(map['rota']),
//      daysOffOption: daysOffOption,
//      holidaysOffOption: holidaysOption,
//    ),
//  );
  // Blocs
//WARNING!! all the dependencies of Blocs must be awaited. This happens in
//class MyApp  .There is a widget FutureBuilder which awaits  future: sl.allReady(),
  // before building. That's why i can use register Factory and not registerFactoryAsync

  sl.registerSingletonAsync<RotaYearMemorized>(
    () {
      getLogger('injectionContainer')
          .d(' registerSingletonAsync<RotaYearMemorized>');
      return RotaYearMemorized.getObject(
        createRotaYearIfDoesNotExistUseCase: sl(),
      );
    },
    dependsOn: [CreateRotaYearIfDoesNotExistUseCase],
  );

//
  sl.registerSingletonWithDependencies<CalendarInitialStateStartUp>(() {
    getLogger('injectionContainer').d('sl.get--CalendarInitialStateStartUp');
    return CalendarInitialStateStartUp(
      getAnnualDaysOff: sl(),
      getHolidays: sl(),
      rotaYearMemorized: sl(),
    );
  }, dependsOn: [
    CreateRotaYearIfDoesNotExistUseCase,
    GetAnnualDaysOff,
    GetHolidays,
  ]);

  sl.registerSingletonAsync<CalendarInitialStateDataClass>(
    () {
      getLogger('injectionContainer')
          .d('registerSingletonAsync<CalendarInitialStateDataClass');
      return CalendarInitialStateDataClass.getObject(
        initialStateStartUp: sl(),
      );
    },
    dependsOn: [CalendarInitialStateStartUp],
  );

//  sl.registerFactory<CalendarBloc>(() {
//    logger.d('Now I will try to create CalendarBloc');
//    return CalendarBloc(
//      getCurrentRotaYear: sl(),
//      getAnnualDaysOff: sl(),
//      getHolidays: sl(),
//    );
//  });

  sl.registerSingletonWithDependencies<CalendarBloc>(
    () {
      getLogger('injectionContainer')
          .d(' CalendarBloc  returned from function');
      return CalendarBloc(
        initialStateDataClass: sl(),
        getCurrentRotaYear: sl(),
        getAnnualDaysOff: sl(),
        getHolidays: sl(),
      );
    },
    dependsOn: [
      GetCurrentRotaYear,
      GetHolidays,
      GetAnnualDaysOff,
      CalendarInitialStateDataClass,
    ],
  );
  sl.registerSingletonWithDependencies<HolidaysBloc>(() {
    return HolidaysBloc(
      changeHolidaysHours: sl(),
      addDeleteHoliday: sl(),
      getHolidays: sl(),
      calendarBloc: sl(),
    );
  }, dependsOn: [AddDeleteHoliday, CalendarBloc, GetHolidays]);

//  sl.registerFactory<HolidaysBloc>(() {
//    logger.d('Now I will try to create HolidaysBloc');
//    return HolidaysBloc(
//      addDeleteHoliday: sl(),
//      getHolidays: sl(),
//      calendarBloc: sl(),
//    );
//  });
  //sl.isReady<HolidaysBloc>().then((_) => print('wyczekalem'));
  // sl.registerFactory(() => null);

  //needed to insert data when run 1st time. Default value RotaYear
}

//  sl.registerSingletonAsync is used if (Future is returned)  as value
