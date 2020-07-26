// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'holiday_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HolidayDto _$_$_HolidayDtoFromJson(Map<String, dynamic> json) {
  return _$_HolidayDto(
    epochTimeStamp: json['epochTimeStamp'] as int,
    hours: json['hours'] as int,
    year: json['year'] as int,
  );
}

Map<String, dynamic> _$_$_HolidayDtoToJson(_$_HolidayDto instance) =>
    <String, dynamic>{
      'epochTimeStamp': instance.epochTimeStamp,
      'hours': instance.hours,
      'year': instance.year,
    };
