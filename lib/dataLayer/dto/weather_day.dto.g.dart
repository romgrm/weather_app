// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_day.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WeatherDayDto _$$_WeatherDayDtoFromJson(Map<String, dynamic> json) =>
    _$_WeatherDayDto(
      dt_txt: json['dt_txt'] == null
          ? null
          : DateTime.parse(json['dt_txt'] as String),
      main: json['main'] == null
          ? null
          : MainDto.fromJson(json['main'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => WeatherDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_WeatherDayDtoToJson(_$_WeatherDayDto instance) =>
    <String, dynamic>{
      'dt_txt': instance.dt_txt?.toIso8601String(),
      'main': instance.main,
      'weather': instance.weather,
    };
