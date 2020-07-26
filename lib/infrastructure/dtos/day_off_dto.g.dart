// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_off_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DayOffDto _$_$_DayOffDtoFromJson(Map<String, dynamic> json) {
  return _$_DayOffDto(
    id: json['id'] as String,
    dayNumber: json['dayNumber'] as int,
    year: json['year'] as int,
    rota: json['rota'] as int,
    chosenYear: json['chosenYear'] as int,
  );
}

Map<String, dynamic> _$_$_DayOffDtoToJson(_$_DayOffDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dayNumber': instance.dayNumber,
      'year': instance.year,
      'rota': instance.rota,
      'chosenYear': instance.chosenYear,
    };
