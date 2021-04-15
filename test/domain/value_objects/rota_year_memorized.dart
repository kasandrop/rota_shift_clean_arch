/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 11:47
 *
 */

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rotashiftcleanarch/domain/usecases/daysOff/get_create_rotayear_if_doesnot_exist.dart';

@immutable
class RotaYearMemorized extends Equatable {
  static CreateRotaYearIfDoesNotExistUseCase createRotaYearIfDoesNotExistUseCase;
  final int rota;
  final int year;

  RotaYearMemorized._({
    @required this.rota,
    @required this.year,
  });

  static Future<RotaYearMemorized> getObject(
      {CreateRotaYearIfDoesNotExistUseCase createRotaYearIfDoesNotExistUseCase}) async {
    Map<String, int> map =
        await createRotaYearIfDoesNotExistUseCase.saveDefaultOrJustCreateRotaYear();
    return RotaYearMemorized._(rota: map['rota'], year: map['year']);
  }

  @override
  // TODO: implement props
  List<Object> get props => [rota, year];
}
