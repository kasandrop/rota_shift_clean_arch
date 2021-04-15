/*
 * *
 *  * Created by Marcin Wasilewski on 26/07/20 12:03
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 26/07/20 11:47
 *
 */

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:rotashiftcleanarch/core/domain/common_interfaces.dart';
import 'package:rotashiftcleanarch/core/domain/failures.dart';

import '../value_objects/input_to_entities.dart';

@immutable
class RotaYear extends Equatable implements IValidatable {
  final Rota rota;
  final Year year;

  RotaYear._(this.rota, this.year);

  factory RotaYear.fromValueObject({
    @required Rota rota,
    @required Year year,
  }) {
    return RotaYear._(
      rota,
      year,
    );
  }

  factory RotaYear({
    @required int rota,
    @required int year,
  }) {
    return RotaYear._(
      Rota(rota),
      Year(year),
    );
  }

  RotaYear.empty()
      : rota = Rota(0),
        year = Year(0);

  //TODO:check this funcvtion test for
  Option<ValueFailure<dynamic>> get failureOption {
    return rota.failureOrUnit
        .andThen(year.failureOrUnit)
        .fold((l) => some(l), (r) => none());
  }

  int getRotaOrCrash() => rota.getOrCrash();

  int getYearOrCrash() => year.getOrCrash();

  @override
  // TODO: implement props
  List<Object> get props => [rota.value, year.value];

  @override
  bool isValid() {
    return rota.isValid() ? (year.isValid() ? true : false) : false;
  }

  factory RotaYear.fromJson(Map<String, dynamic> parsedJson) {
    int r = parsedJson['rota'];
    int y = parsedJson['year'];
    return RotaYear(rota: r, year: y);
  }

  Map<String, dynamic> toMap() {
    return {'rota': rota.getOrCrash(), 'year': year.getOrCrash()};
  }

  @override
  String toString() {
    return " 'rota': ${rota.getOrCrash()}, 'year':${year.getOrCrash()}";
  }
}
